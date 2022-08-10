import 'package:flutter/material.dart';
import 'package:auth_example/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const colors = AppColors();

  static ThemeData get basic => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      canvasColor: Colors.white,
      primaryColor: Colors.black);
}
