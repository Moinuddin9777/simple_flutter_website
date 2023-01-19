import 'package:flutter/material.dart';

abstract class ThemeDataState {
  final ThemeData theme;
  ThemeDataState({required this.theme});
}

class DarkThemeActivated extends ThemeDataState {
  DarkThemeActivated({
    required super.theme,
  });
}

class LightThemeActivated extends ThemeDataState {
  LightThemeActivated({
    required super.theme,
  });
}
