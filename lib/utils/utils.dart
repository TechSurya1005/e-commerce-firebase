import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/constant/colors.dart';

class Utils {

  static void fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message,Color color) {
    Fluttertoast.showToast(msg: message,
    textColor: buttonTextColor,
      backgroundColor: color,
      fontSize: 14.0,
      toastLength: Toast.LENGTH_SHORT,
    );
  }


  static void flushBarErrorMessage(String title,String message,BuildContext context,Color color){
    showFlushbar(context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          backgroundColor: color,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 28,color: Colors.white,),
          titleText:  Text(title,style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
          ),),
          borderRadius: BorderRadius.circular(16.0),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(message,style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
          ),),
        ));
  }

}