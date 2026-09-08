import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.primaryBg,
      primaryColor: AppColors.accent,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.cardBg,
      ),
      textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: AppColors.primaryText,
        displayColor: AppColors.primaryText,
        fontFamily: 'sans-serif',
      ),
      dividerColor: AppColors.border,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightPrimaryBg,
      primaryColor: AppColors.accent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.lightCardBg,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.lightPrimaryText,
        displayColor: AppColors.lightPrimaryText,
        fontFamily: 'sans-serif',
      ),
      dividerColor: AppColors.lightBorder,
    );
  }
}
