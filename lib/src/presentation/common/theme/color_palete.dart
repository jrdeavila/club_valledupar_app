import 'package:flutter/material.dart';

class ColorPalete {
  final Color textOnPrimary = const Color.fromARGB(255, 245, 245, 245);
  final Color textOnSecondary = const Color.fromARGB(255, 54, 56, 56);
  final Color componentColor = const Color.fromARGB(255, 245, 245, 245);
  final Color blurredChildColor = const Color.fromARGB(153, 245, 245, 245);
  final Color blurredColor = const Color.fromARGB(85, 245, 245, 245);
  final Color textOnError = const Color.fromARGB(255, 247, 247, 247);
  final Color componentOnError = const Color.fromARGB(255, 207, 100, 100);

  ColorPalete light() {
    return ColorPalete();
  }
}

abstract class AppTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: colorScheme,
    fontFamily: 'Poppins',
    // colorScheme: colorScheme,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    timePickerTheme: timePickerTheme,
    datePickerTheme: datePickerTheme,
    useMaterial3: true,
  );

  // Configuracion de paleta de colores
  static const ColorScheme colorScheme = ColorScheme(
    primary: Color.fromARGB(255, 70, 165, 202),
    secondary: Color.fromARGB(255, 63, 183, 253),
    tertiary: Color.fromARGB(255, 112, 195, 243),
    surface: Color.fromARGB(255, 119, 119, 119),
    background: Color.fromARGB(255, 253, 253, 253),
    error: Color.fromARGB(255, 207, 100, 100),
    onSecondary: Color.fromARGB(255, 54, 56, 56),
    onPrimary: Color.fromARGB(255, 54, 56, 56),
    onSurface: Color.fromARGB(255, 70, 160, 202),
    onBackground: Color.fromARGB(255, 214, 230, 245),
    onError: Color.fromARGB(255, 247, 247, 247),
    brightness: Brightness.dark,
  );

  // Configuracion de la barra superior
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    ),
  );

  // Configuracion de los inputs
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: colorScheme.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 20,
    ),
    hintStyle: const TextStyle(
      color: Color.fromARGB(255, 54, 56, 56),
    ),
  );

  static final TimePickerThemeData timePickerTheme = TimePickerThemeData(
    backgroundColor: colorScheme.background,
  );

  static final DatePickerThemeData datePickerTheme = DatePickerThemeData(
    backgroundColor: colorScheme.background,
  );
}
