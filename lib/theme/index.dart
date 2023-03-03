import 'package:flutter/material.dart';

part 'light.dart';
part 'dark.dart';

enum ThemeName {
  light, /// Light theme
  dark, /// Dart theme
  system, /// System current theme
}
/// Extension to get the theme name string from ThemeName enum
extension ParseToString on ThemeName{
  String toStr() {
    return toString().split('.').last;
  }
}