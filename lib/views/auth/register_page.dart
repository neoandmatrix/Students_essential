import 'package:flutter/material.dart';
import 'package:for_students/components/text_fiels/email_text_field.dart';
import 'package:for_students/components/text_fiels/password_text_field.dart';
import 'package:for_students/components/ui_components/dialogs/generic_auth_error_dialog.dart';
import 'package:for_students/services/auth/auth_exceptions.dart';
import 'package:for_students/services/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassowrd;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassowrd = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassowrd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' register',
            style: GoogleFonts.bebasNeue(
              fontSize: 35,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: FutureBuilder(
        future: AuthService.firebase().initalize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return ListView(
                children: [
                  const SizedBox(
                    height: 160,
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    child: EmailTextField(
                      controller: _email,
                      hintText: 'ENTER THE EMAIL',
                    ),
                  ),

                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    child: PasswordTextField(
                      controller: _password,
                      hintText: 'ENETR PASSOWRD',
                    ),
                  ),

                  // confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 8.0,
                    ),
                    child: PasswordTextField(
                      controller: _confirmPassowrd,
                      hintText: 'CONFIRM PASSWORD',
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                    onTap: () async {
                      final email = _email.text;
                      final password = _password.text;
                      final confirmedPassword = _confirmPassowrd.text;

                      if ((email.isNotEmpty &&
                              password.isNotEmpty &&
                              confirmedPassword.isNotEmpty) &&
                          (password == confirmedPassword)) {
                        try {
                          await AuthService.firebase().createUser(
                            email: email,
                            password: password,
                          );
                          await AuthService.firebase().sendEmailVerification();
                          if (!context.mounted) return;
                          Navigator.of(context).pushNamed('verifyEmail');
                        } on EmailAlreadyInUseAuthException {
                          if (!context.mounted) return;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AuthErrorDialog(
                                    title: 'ERROR',
                                    content: 'EMAIL ALREADY IN USE');
                              });
                        } on InvalidEmailAuthException {
                          if (!context.mounted) return;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AuthErrorDialog(
                                  title: 'ERROR', content: 'INVALID EMAIL');
                            },
                          );
                        } on WeakPasswordAuthException {
                          if (!context.mounted) return;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AuthErrorDialog(
                                    title: 'ERROR',
                                    content: 'PLEASE USE A STRONG PASSWORD');
                              });
                        }
                      } else if (password != confirmedPassword) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AuthErrorDialog(
                                title: 'ERROR',
                                content: 'PASSWORDS DON\'T MATCH',
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AuthErrorDialog(
                                title: 'EMPTY FIELDS',
                                content: 'PLEASE FILL OUT BOTH FIELDS',
                              );
                            });
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
