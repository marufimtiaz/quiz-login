import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: const Color(0xFF57AF12),
    secondary: Colors.grey,
    tertiary: Colors.grey.shade300,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
);
