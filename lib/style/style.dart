import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  // Colors
  static const Color background = Color.fromARGB(255, 23, 24, 26);
  static const Color primary = Colors.white;
  static const Color lightGray = Color.fromARGB(255, 162, 162, 162);
  static const Color gray = Color.fromARGB(255, 69, 70, 72);
  static const Color darkGray = Color.fromARGB(255, 35, 35, 35);
  static const Color green = Color.fromARGB(255, 0, 214, 79);
  static const Color blue = CupertinoColors.activeBlue;

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

  static Text couponCode(text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
    );
  }

  static Text couponCodeSub(text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: primary,
      ),
    );
  }

  static Text couponDetails(text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: lightGray,
      ),
    );
  }

  static Text mapTitle(text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blue,
      ),
    );
  }

  static Text mapDescription(text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: gray,
      ),
    );
  }
}
