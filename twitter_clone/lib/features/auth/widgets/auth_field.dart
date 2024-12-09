import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/palette.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;

  const AuthField({
    super.key, 
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Palette.blueColor,
            width: 3,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
      ),
    );
  }
}