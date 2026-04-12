
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles{
  static TextStyle blackBold24 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  ) ;
  static TextStyle blackMed18 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  ) ;
  static TextStyle blackBold14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  ) ;
  static TextStyle greyMed14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  ) ;
  static TextStyle blueBold14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ) ;
  static TextStyle whiteMed18 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  ) ;
}