import 'package:flutter/material.dart';

abstract class ColorPalete {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    timePickerTheme: timePickerTheme,
    datePickerTheme: datePickerTheme,
    useMaterial3: true,
  );

  // Configuracion de paleta de colores
  static const ColorScheme colorScheme = ColorScheme(
    primary: Color.fromARGB(255, 118, 202, 70),
    secondary: Color.fromARGB(255, 202, 253, 63),
    tertiary: Color.fromARGB(255, 243, 234, 112),
    surface: Color.fromARGB(255, 119, 119, 119),
    background: Color.fromARGB(255, 253, 253, 253),
    error: Color.fromARGB(255, 207, 100, 100),
    onPrimary: Color.fromARGB(255, 245, 245, 245),
    onSecondary: Color.fromARGB(255, 54, 56, 56),
    onSurface: Color.fromARGB(255, 118, 202, 70),
    onBackground: Color.fromARGB(255, 228, 245, 214),
    onError: Color.fromARGB(255, 247, 247, 247),
    brightness: Brightness.dark,
  );

  // Configuracion de la barra superior
  static final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: colorScheme.onPrimary,
    elevation: 0,
    titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 54, 56, 56)),
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
