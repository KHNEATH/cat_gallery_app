import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Static method for common text styles
  static TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      bodyLarge: TextStyle(color: textColor, fontSize: 16),
      bodyMedium: TextStyle(color: textColor.withOpacity(0.7), fontSize: 14),
    );
  }

  // Light theme definition
  final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.pinkAccent,
    textTheme: _buildTextTheme(Colors.black), // Calling the static method
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.pinkAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.pinkAccent,
      secondary: Colors.yellowAccent,
      surface: Colors.white,
    ),
  );

  // Dark theme definition
  final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.pink,
    textTheme: _buildTextTheme(Colors.white), // Calling the static method
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.pink,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.pink,
      secondary: Colors.yellow,
      surface: Colors.black,
    ),
  );

  bool isDarkTheme = false;

  // Get the current theme
  ThemeData get currentTheme => isDarkTheme ? darkTheme : lightTheme;

  // Toggle theme between light and dark
  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
