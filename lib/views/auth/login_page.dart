import 'package:flutter/material.dart';
import 'package:for_students/components/text_fiels/email_text_field.dart';
import 'package:for_students/components/text_fiels/password_text_field.dart';
import 'package:for_students/components/ui_components/dialogs/generic_auth_error_dialog.dart';
import 'package:for_students/services/auth/auth_exceptions.dart';
import 'package:for_students/services/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
            ' login',
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
                    height: 200,
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: EmailTextField(
                      controller: _email,
                      hintText: 'ENTER EMAIL ID',
                    ),
                  ),

                  //password
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: PasswordTextField(
                        controller: _password,
                        hintText: 'ENTER THE PASSWORD',
                      )),

                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: () async {
                      final email = _email.text;
                      final password = _password.text;

                      if (email.isNotEmpty && password.isEmpty) {
                        try {
                          await AuthService.firebase()
                              .logIn(email: email, password: password);

                          final user = AuthService.firebase().currentUser;

                          if (user?.isEmailVerified ?? false) {
                            if (!context.mounted) return;
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main', (route) => false);
                          } else {
                            if (!context.mounted) return;
                            Navigator.of(context).pushNamed('/verifyEmail');
                          }
                        } on UserNotFoundAuthException {
                          if (!context.mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AuthErrorDialog(
                                  title: 'USER NOT FOUND',
                                  content: 'PLEASE REGISTER FIRST');
                            },
                          );
                        } on WrongPasswordAuthException {
                          if (!context.mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AuthErrorDialog(
                                title: 'WRONG CEDENTIAL',
                                content: 'PLEASE ENTER CORRECT CREDENTIALS',
                              );
                            },
                          );
                        } on GenericAuthException catch (e) {
                         //final String errorCode = e.code;


                          if (!context.mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return  AuthErrorDialog(
                                title: '$e',
                                content: 'PLEASE REPORT TO US',
                              );
                            },
                          );
                        }
                      } else {
                        bool emailEmpty = email.isNotEmpty;
                        bool passwordEmpty = password.isEmpty;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AuthErrorDialog(
                              title: '$emailEmpty',
                              content: '$passwordEmpty',
                            );
                          },
                        );
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
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
