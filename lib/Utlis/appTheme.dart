import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_iti/Utlis/constant.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Constant.primaryColor,
      primaryColor: Constant.primaryColor,
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              color: Constant.whiteColor,
              fontSize: 35),
        bodyMedium: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w100,
            color: Constant.whiteColor,
            fontSize: 60)


      )

  );

}
