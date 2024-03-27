import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.key_sharp,
          color: Colors.lightBlue,
        ),
        prefixIconColor: Colors.black,
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
