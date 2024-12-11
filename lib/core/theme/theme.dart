import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF8c52ff),
    colorScheme: const ColorScheme.dark(
        surface: Color(0xFF171717),
        surfaceContainer: Color(0xff303030),
        secondaryContainer: Color(0xff282828),
        secondary: Color(0xFFa717eb)),
    useMaterial3: true,
    fontFamily: GoogleFonts.wixMadeforDisplay().fontFamily,
  );
}
