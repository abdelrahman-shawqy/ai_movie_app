import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{

  static TextStyle get  simiBold600S18  => GoogleFonts.montserrat(
    color:  AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height:1.6,
    letterSpacing: 0.12
  );
  static TextStyle get  h5Medium500S14  => GoogleFonts.montserrat(
      color:  AppColors.grayColor,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height:1.5,
      letterSpacing: 0.12
  );

  static TextStyle get  simiBold600S24  => GoogleFonts.montserrat(
      color:  AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      height:1.6,
      letterSpacing:0.12,

  );
  static TextStyle get  medium500S20  => GoogleFonts.montserrat(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      height:1,
      letterSpacing:0.12,

  );
  static TextStyle get  H4Medium500S16  => GoogleFonts.montserrat(
      color: AppColors.grayColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height:1,
      letterSpacing:0.12,

  );
  static TextStyle get  H4Semibold600S16  => GoogleFonts.montserrat(
      color: AppColors.primaryBlueAccent,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height:1,
      letterSpacing:0.12,

  );
  static TextStyle get  H4Semibold500S14  => GoogleFonts.montserrat(
    color: AppColors.primaryBlueAccent,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height:1.2,
    letterSpacing:0.12,

  );

  static TextStyle get  H4Semibold600AppBar  => GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height:1,
    letterSpacing:0.12,

  );

  static TextStyle get  H6Medium500S12 => GoogleFonts.montserrat(
    color: AppColors.whiteGrey,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height:1,
    letterSpacing:0.12,

  );
  static TextStyle get  H4Semibold600S16White  => GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height:2,
    letterSpacing:0.12,

  );
  static TextStyle get  H6Medium500S12primaryBlueAccent => GoogleFonts.montserrat(
    color: AppColors.primaryBlueAccent,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height:1,
    letterSpacing:0.12,

  );

}