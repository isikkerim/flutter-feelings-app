import 'package:flutter/material.dart';


Color color_1 = const Color.fromRGBO(212, 144, 255, 1);

Color color_2 = const Color.fromRGBO(215, 153, 255, 1);

Color color_3 = const Color.fromRGBO(224, 176, 255, 1);

Color color_4 = const Color.fromRGBO(235, 203, 255, 1);

Color color_5 = const Color.fromRGBO(239, 215, 255, 1);

abstract class ThemeConstans {
  ThemeConstans._();

  // Light Theme
  static ColorScheme lightColorScheme = ColorScheme(
    primary: color_1,
    secondary:Colors.white,
    surface:Colors.white,
    error: Colors.red,
    onPrimary: color_1,
    onSecondary: Colors.white,
    onSurface: color_2,
    onError: Colors.red,
    brightness: Brightness.light,

  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.black,
    secondary: Colors.yellow,
    surface: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
        secondaryHeaderColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          // Tüm büyük metinler
          bodyMedium: TextStyle(color: Colors.black),
          // Orta boyutlu metinler
          bodySmall: TextStyle(color: Colors.black),
          // Küçük metinler
          headlineLarge: TextStyle(color: Colors.black),
          headlineMedium: TextStyle(color: Colors.black),
          headlineSmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
        ),
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        highlightColor: Colors.transparent,
        buttonTheme: ButtonThemeData(colorScheme: colorScheme));
  }
}
