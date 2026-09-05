import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heroHeading(bool isDark) => GoogleFonts.plusJakartaSans(
        fontSize: 60,
        fontWeight: FontWeight.w800,
        color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle sectionHeading(bool isDark) => GoogleFonts.plusJakartaSans(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
        letterSpacing: -1.0,
      );

  static TextStyle cardHeading(bool isDark) => GoogleFonts.plusJakartaSans(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: isDark ? AppColors.primaryText : AppColors.lightPrimaryText,
      );

  static TextStyle body(bool isDark) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
        height: 1.6,
      );

  static TextStyle button(bool isDark) => GoogleFonts.plusJakartaSans(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      );

  static TextStyle metadata(bool isDark) => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: isDark ? AppColors.secondaryText : AppColors.lightSecondaryText,
      );
}
