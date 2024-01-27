// import 'package:assignment_1/screens/dummy.dart';
import 'package:shoppy_app/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.system,
      // theme: theme,
      home: HomePage(),
    );
  }
}
