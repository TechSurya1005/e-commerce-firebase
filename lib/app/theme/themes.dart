import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/app/theme/textTheme.dart';
import '../../constant/colors.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(accentColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0), // Apply border radius here
            ),
          ),
        )),
    buttonTheme: ButtonThemeData(
        buttonColor: accentColor
    ),
    scaffoldBackgroundColor: primaryColor,
    brightness: Brightness.light,
    textTheme: MyTextTheme.lightTextTheme,
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

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: primaryColor,
      primaryColor: primaryDarkColor,
      buttonTheme: ButtonThemeData(
          buttonColor: accentDarkColor
      ),
      brightness: Brightness.dark,
      textTheme: MyTextTheme.darkTextTheme,
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
}

