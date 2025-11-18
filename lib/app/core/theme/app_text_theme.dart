import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTextTheme {
  static TextTheme get light => TextTheme(
    titleLarge: GoogleFonts.manrope(
        fontSize: 64,
        fontWeight: FontWeight.w600,
        color: Colors.white
    ),

    bodyLarge: GoogleFonts.manrope(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),

  );
}