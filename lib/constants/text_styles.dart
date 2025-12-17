import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {

  static TextStyle header = GoogleFonts.inter(
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle sectionTitle = GoogleFonts.inter(
    color: AppColors.textWhite,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle labelGold = GoogleFonts.inter(
    color: AppColors.textGold,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle labelGold2 = GoogleFonts.inter(
    color: AppColors.textGold,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyText = GoogleFonts.inter(
    color: AppColors.textWhite,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyTextWhite = GoogleFonts.inter(
    color: AppColors.textWhite,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    color: AppColors.textWhite,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle chipText = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static TextStyle saveButton = GoogleFonts.inter(
    color: AppColors.textGold,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}