import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xFFb00be4),
      colorScheme: const ColorScheme.dark(
          surface: Color(0xFF000000),
          surfaceContainer: Color(0xff191919),
          secondaryContainer: Color(0xff282828),
          secondary: Color(0xFF8108fc)),
      useMaterial3: true,
      fontFamily: GoogleFonts.wixMadeforDisplay().fontFamily);
}
