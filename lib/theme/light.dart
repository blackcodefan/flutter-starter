part of 'package:flutter_starter/theme/index.dart';

ThemeData lightTheme = ThemeData(
    toggleableActiveColor: const Color(0xFFED145B),
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF5A5B51))
        )
    ),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFED145B),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFED145B),
        onSecondary: Color(0xFFFFFFFF),
        outline: Color(0xFF5A5B51)
    )
);