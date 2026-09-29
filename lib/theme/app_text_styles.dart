import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finemotor/theme/app_colors.dart';

abstract final class AppTextStyles {
  static TextStyle heroTitle([Color? color]) => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: color ?? AppColors.navy,
      );

  static TextStyle sectionLabel([Color? color]) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: color ?? AppColors.bodyTertiary,
      );

  static TextStyle body([Color? color]) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.bodySecondary,
      );

  static TextStyle buttonLabel([Color? color]) => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: color ?? AppColors.white,
      );
}
