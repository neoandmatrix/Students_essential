import 'package:flutter/material.dart';
import 'package:for_students/services/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' Verify Email',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            ' Please check your inbox of registered email id and use the sent mail to verify it and after verification use refresh icon to recresh this page to proceed further',
            style: GoogleFonts.bebasNeue(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final emailVerificationSuccessful =
              await AuthService.firebase().verifyUserEmail();
          if (emailVerificationSuccessful) {
            if (!context.mounted) return;
            Navigator.of(context).pushNamed('/main');
          }
        },
        child: const Icon(Icons.refresh),
      ),
      //TODO IMPLEMENT RELOAD
    );
  }
}
