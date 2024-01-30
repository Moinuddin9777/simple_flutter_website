import 'package:getxapi/HomeBindings/binding.dart';
import 'package:getxapi/Myapp/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final ThemeData baseTheme = ThemeData.light();
    return GetMaterialApp(
      theme: ThemeData.from(
        colorScheme: baseTheme.colorScheme.copyWith(
          primary: Colors.indigo,
          secondary: Colors.black,
        ),
        textTheme: GoogleFonts.robotoCondensedTextTheme().copyWith(
          headline6: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
          headline5: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.black,
          ),
          headline4: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
            color: Colors.black,
          ),
          bodyText1: const TextStyle(
            fontSize: 16.0,
            color: Color.fromARGB(255, 124, 37, 247),
          ),
          bodyText2: const TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(255, 124, 37, 247),
          ),
        ),
      ),
      initialBinding: HomeBinding(),
      home: const HomeScreen(),
    );
  }
}
