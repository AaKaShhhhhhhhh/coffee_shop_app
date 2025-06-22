import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: Color(0xFFF8F5F2),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.brown[900],
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.brown[900],
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontFamily: 'Sora', color: Colors.brown[900]),
      titleMedium: TextStyle(fontFamily: 'Sora', color: Colors.brown[800]),
      bodyLarge: TextStyle(fontFamily: 'Sora', color: Colors.brown[700]),
      bodyMedium: TextStyle(fontFamily: 'Sora', color: Colors.brown[800]),
      bodySmall: TextStyle(fontFamily: 'Sora', color: Colors.brown[600]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[400],
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey[200]!,
      selectedColor: Colors.brown[200]!,
      labelStyle: TextStyle(color: Colors.brown[900]),
      secondaryLabelStyle: TextStyle(color: Colors.brown[900]),
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.brown,
    scaffoldBackgroundColor: Color(0xFF23211E),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF23211E),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Sora',
        color: const Color.fromARGB(255, 31, 4, 4),
      ),
      titleMedium: TextStyle(
        fontFamily: 'Sora',
        color: const Color.fromARGB(240, 92, 90, 90),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Sora',
        color: const Color.fromARGB(255, 230, 222, 222),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Sora',
        color: const Color.fromARGB(232, 119, 117, 117),
      ),
      bodySmall: TextStyle(
        fontFamily: 'Sora',
        color: const Color.fromARGB(255, 117, 112, 112),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.brown[800]!,
      selectedColor: Colors.brown[400]!,
      labelStyle: TextStyle(color: const Color.fromARGB(255, 33, 2, 2)),
      secondaryLabelStyle: TextStyle(
        color: const Color.fromARGB(244, 233, 227, 227),
      ),
      brightness: Brightness.dark,
    ),
  );
}
