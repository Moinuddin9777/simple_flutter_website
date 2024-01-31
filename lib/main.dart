
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment/pages/home_page/home_screen1.dart';



final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 196, 164, 132),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 182, 193),
  colorScheme: colorScheme,
  textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.robotoCondensed(
      fontWeight: FontWeight.bold,
    ),
  ),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
