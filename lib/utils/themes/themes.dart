import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Theme file containing color schemes for light and dark theme
class Themes {
  //light theme scheme
  Gradient primaryGradient = const LinearGradient(
    colors: [Color(0xFF43C23F), Color(0xFFA5D037)],
  );
  final lightTheme = ThemeData(
    fontFamily: "SFProDisplay",
    scaffoldBackgroundColor: Colors.grey.shade200,
  ).copyWith(
      primaryColor: const Color(0xFF43C23F),
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF43C23F),
        secondary: Color(0xFFA5D037),
      ),
      textTheme: GoogleFonts.outfitTextTheme());

  //dark theme scheme
  final darkTheme = ThemeData(
    fontFamily: "SFProDisplay",
    scaffoldBackgroundColor: Colors.grey.shade200,
  ).copyWith(
      primaryColor: Colors.red,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.outfitTextTheme());
}
