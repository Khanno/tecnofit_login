import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    backgroundColor: Colors.white,
    primaryColor: const Color(0xFF3155c7),
    colorScheme: const ColorScheme(
      primary: Color(0xFF3155c7),
      primaryVariant: Color(0xFF6B56C5),
      onPrimary: Color(0xFF464555),
      secondary: Color(0xFF8F59C1),
      secondaryVariant: Color(0xFFAC5CBC),
      onSecondary: Color(0xFFABA9BC),
      background: Colors.white,
      onBackground: Color(0xFF8C8CC1),
      surface: Color(0xFFC462B6),
      onSurface: Color(0xFFD76BB0),
      error: Color(0xFFBC1036),
      onError: Color(0xFFBFA5A4),
      brightness: Brightness.dark,
    ),
  );
}
