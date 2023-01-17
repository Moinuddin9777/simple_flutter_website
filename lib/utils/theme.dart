import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light()
      .copyWith(cardColor: Colors.lightBlue, useMaterial3: true);

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    buttonColor: Colors.amberAccent,
    useMaterial3: true,
  );

  ///  UNDER DEVELOPMENT ///
  static final ThemeData highContrastTheme = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
    ),
    useMaterial3: true,
  );
}
