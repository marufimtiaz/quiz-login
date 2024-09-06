import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: fillColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      obscureText: obscureText,
    );
  }
}
