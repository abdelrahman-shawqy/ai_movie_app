import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle{

  static TextStyle get  simiBold600  => GoogleFonts.montserrat(
    color:  AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height:1.6,
    letterSpacing: 0.12
  );
  static TextStyle get  h5Medium  => GoogleFonts.montserrat(
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

}