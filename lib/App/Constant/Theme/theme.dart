import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemeType{
  lightTheme,
  darkTheme,
}

final appTheme = {
  ThemeType.darkTheme : ThemeData(
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    cardColor: Color(0xffC8E6F3).withOpacity(0.80),
    dividerColor: Color(0xff6B6B6B).withOpacity(0.70),
    canvasColor: Color(0xffC8E6F3),
    primaryColor: Color(0xff2C3333),
    textTheme: TextTheme(
    titleSmall: GoogleFonts.roboto(
      color: Color(0xff000000),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      
    ),
    titleLarge: GoogleFonts.roboto(
      color: Color(0xff000000),
      fontSize: 40,
      fontWeight: FontWeight.w700,

    ),
    labelMedium: GoogleFonts.roboto(
      color: Color(0xff2C3333).withOpacity(0.70),
      fontSize: 16,
      fontWeight: FontWeight.w400
    ),
    labelSmall: GoogleFonts.roboto(
      color: Color(0xff2C3333),
      fontSize: 8,
      fontWeight: FontWeight.w600,
    ),
     bodyMedium: GoogleFonts.roboto(
      color: Color(0xffFFFFFF),
      fontSize: 18, fontWeight: FontWeight.w600,
     )
    )
  ),
  ThemeType.lightTheme : ThemeData(
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    cardColor: Color(0xffC8E6F3).withOpacity(0.80),
    dividerColor: Color(0xff6B6B6B).withOpacity(0.70),
    canvasColor: Color(0xffC8E6F3),
    primaryColor: Color(0xff1279FC),
    hoverColor: Color(0xffF1F9FF),
    textTheme: TextTheme(
    titleSmall: GoogleFonts.roboto(
      color: Color(0xff000000),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      
    ),
    titleLarge: GoogleFonts.roboto(
      color: Color(0xff000000),
      fontSize: 40,
      fontWeight: FontWeight.w700,

    ),
    labelMedium: GoogleFonts.roboto(
      color: Color(0xff2C3333).withOpacity(0.70),
      fontSize: 16,
      fontWeight: FontWeight.w400
    ),
    labelSmall: GoogleFonts.roboto(
      color: Color(0xff2C3333),
      fontSize: 8,
      fontWeight: FontWeight.w600,
    ),
     bodyMedium: GoogleFonts.roboto(
      color: Color(0xffFFFFFF),
      fontSize: 18, fontWeight: FontWeight.w600,
     )
    )
  )
};