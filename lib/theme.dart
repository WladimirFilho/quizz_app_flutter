import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'no_transitions.dart';

var appTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(14),
    backgroundColor: Colors.orangeAccent,
    foregroundColor: Colors.blue,
  )),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      for (final platform in TargetPlatform.values) platform: const NoTransitions(),
    },
  ),
  appBarTheme: const AppBarTheme(
    // backgroundColor: Colors.black87,
    elevation: 0,
  ),
  fontFamily: GoogleFonts.nunito().fontFamily,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87,
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.grey,
    ),
  ),
  buttonTheme: const ButtonThemeData(),
);
