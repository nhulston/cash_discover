import 'package:flutter/material.dart';

class Style {
  // Colors
  static const Color background = Color.fromARGB(255, 23, 24, 26);
  static const Color primary = Colors.white;
  static const Color lightGray = Color.fromARGB(255, 162, 162, 162);
  static const Color gray = Color.fromARGB(255, 69, 70, 72);
  static const Color darkGray = Color.fromARGB(255, 35, 35, 35);
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

  static Text p(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: lightGray,
      ),
    );
  }

  static Text couponHeader(text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: primary,
      ),
    );
  }

  static Text couponParagraph(text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: lightGray,
      ),
    );
  }
}