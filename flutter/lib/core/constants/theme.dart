import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'JosefinSans',
    brightness: Brightness.light,
    primaryColor: Color(0xfffc9401),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xfffc9401),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Color(0xfffc9401)),
    colorScheme: const ColorScheme.light(
      primary: Color(0xfffc9401),
      secondary: Colors.orange, // Bu accentColor o‘rnini bosadi
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.orange, // Bu accentColor o‘rnini bosadi
    ),
  );
}
