import 'package:flutter/material.dart';
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
            ' verify email',
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
        child: Text(
          ' please check your inbox of registered email id and use the sent mail to verify it',
          style: GoogleFonts.bebasNeue(
            fontSize: 35,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton:  const Icon(Icons.refresh),
      //TODO IMPLEMENT RELOAD
    );
  }
}
