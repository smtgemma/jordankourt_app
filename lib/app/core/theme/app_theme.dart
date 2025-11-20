import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.secondaryColor,
      scaffoldBackgroundColor: AppColors.primaryColor,
      cardColor: AppColors.primaryColor,
      shadowColor: AppColors.shadowColor,

      //fontFamily: 'Poppins',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      //textTheme: AppTextTheme.light,
      inputDecorationTheme: InputDecorationThemeData(
        border: InputBorder.none,
        // Also apply it to other border states for consistency.
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
