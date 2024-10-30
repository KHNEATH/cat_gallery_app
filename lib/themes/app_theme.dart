import 'package:flutter/material.dart';

class AppTheme {
  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      elevation: 0,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
    // Add other customizations here
  );

  // Define the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueGrey),
    // Add other customizations here
  );
}
