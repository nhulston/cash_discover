import 'package:flutter/material.dart';

class Style {
  // Colors
  static const Color background = Color.fromARGB(255, 23, 24, 26);
  static const Color primary = Colors.white;
  static const Color gray = Color.fromARGB(255, 69, 70, 72);
  static const Color green = Color.fromARGB(255, 0, 214, 79);

  // Text
  static Text h1(text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: primary,
      ),
    );
  }
}