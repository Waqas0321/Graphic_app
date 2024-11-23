import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Const/aap_colors.dart';

class AppTextTheme {
  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.grey[700],
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 22,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}