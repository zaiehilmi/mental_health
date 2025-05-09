import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => Theme.of(this).elevatedButtonTheme;
  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  CardThemeData get cardTheme => Theme.of(this).cardTheme;
}
