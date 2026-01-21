import 'package:flutter/material.dart';

class AppTheme {
  static final Color _primaryColor = const Color(0xFF137fec);
  static final Color _lightBackgroundColor = const Color(0xFFf6f7f8);
  static final Color _darkBackgroundColor = const Color(0xFF0f172a);
  static final Color _darkSurfaceColor = const Color(0xFF1e293b);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _lightBackgroundColor,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        secondary: const Color(0xFFf9f906), // Yellow accent
        surface: Colors.white,
        background: _lightBackgroundColor,
        error: const Color(0xFFef4444), // Alarm color
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _darkBackgroundColor,
      colorScheme: ColorScheme.dark(
        primary: _primaryColor,
        secondary: const Color(0xFFf9f906), // Yellow accent
        surface: _darkSurfaceColor,
        background: _darkBackgroundColor,
        error: const Color(0xFFef4444), // Alarm color
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: _darkSurfaceColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      cardTheme: CardTheme(
        elevation: 1,
        color: _darkSurfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.grey.shade800, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
      ),
    );
  }
}
