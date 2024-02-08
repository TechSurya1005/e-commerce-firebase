import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/colors.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  buttonTheme: ButtonThemeData(
    buttonColor: accentColor
  ),
  brightness: Brightness.light,
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.poppins(
      color: textColor,
      fontSize: 22,
      fontWeight: FontWeight.w500
    ),
    bodyMedium:  GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500
    ),
    bodySmall:  GoogleFonts.poppins(
    color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w500
  ),

    bodyText1: GoogleFonts.poppins(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500
    ),
    bodyText2: GoogleFonts.poppins(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500
    ),

    button:  GoogleFonts.poppins(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),

    subtitle1: GoogleFonts.poppins(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500
    ),
    subtitle2: GoogleFonts.poppins(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500
    ),

    titleLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 28,
        fontWeight: FontWeight.w600
    ),
    titleMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w600
    ),
    titleSmall:  GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),

    headlineLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 28,
        fontWeight: FontWeight.w600
    ),
    headlineMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w600
    ),
    headlineSmall:  GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),

    displayLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 22,
        fontWeight: FontWeight.w600
    ),
    displayMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),
    displaySmall:  GoogleFonts.poppins(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),

    labelMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),

    labelSmall: GoogleFonts.poppins(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),

      labelLarge: GoogleFonts.poppins(
      color: textColor,
      fontSize: 18,
      fontWeight: FontWeight.w600
  ),




  ),
  useMaterial3: false,
  fontFamily: GoogleFonts.poppins.toString(),
  backgroundColor: primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    elevation: 0,
    centerTitle: true,
  ),
  hintColor:hintColor,
  errorColor: errorColor,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(accentColor),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: accentColor,
  ),
  primaryColorLight: primaryColor,
);

final ThemeData darkTheme = ThemeData(
  primaryColor: primaryDarkColor,
  buttonTheme: ButtonThemeData(
      buttonColor: accentDarkColor
  ),
  brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 22,
          fontWeight: FontWeight.w500
      ),
      bodyMedium:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),
      bodySmall:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
      ),

      bodyText1: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
      ),
      bodyText2: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),

      button:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      subtitle1: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
      subtitle2: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w500
      ),

      titleLarge: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 22,
          fontWeight: FontWeight.w600
      ),
      titleMedium: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w600
      ),
      titleSmall:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      headlineLarge: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 22,
          fontWeight: FontWeight.w600
      ),
      headlineMedium: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w600
      ),
      headlineSmall:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      displayLarge: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 22,
          fontWeight: FontWeight.w600
      ),
      displayMedium: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w600
      ),
      displaySmall:  GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      labelMedium: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 16,
          fontWeight: FontWeight.w600
      ),

      labelSmall: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 14,
          fontWeight: FontWeight.w600
      ),

      labelLarge: GoogleFonts.poppins(
          color: textDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.w600
      ),

    ),
    useMaterial3: false,
    fontFamily: GoogleFonts.poppins.toString(),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDarkColor,
      elevation: 0,
      centerTitle: true,
    ),
    hintColor:hintColor,
    errorColor: errorColor,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStatePropertyAll(accentDarkColor),
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: accentColor,
    ),
  primaryColorDark: primaryDarkColor
);