import 'package:flutter/material.dart';

Widget buildLabel(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'sans-serif',
      fontSize: 13.5,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

InputDecoration buildInputDecoration({
  required String hint,
  required IconData prefixIcon,
  required Color fillColor,
  required Color borderColor,
  required Color goldenColor,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Color(0xFF6B7F56), fontSize: 14.5),
    filled: true,
    fillColor: fillColor,
    prefixIcon: Icon(prefixIcon, color: goldenColor, size: 18),
    suffixIcon: suffix,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 15.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: borderColor, width: 1.2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(color: goldenColor, width: 1.4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Color(0xFF9E3A3A), width: 1.2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: const BorderSide(color: Color(0xFFC04B4B), width: 1.4),
    ),
  );
}
