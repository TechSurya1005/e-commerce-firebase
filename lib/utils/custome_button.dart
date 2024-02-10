import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onTap;
  const CustomButton({super.key, required this.title, this.onTap, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.red,
      child: Container(
        height: 55,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: accentColor,
        ),
        child: isLoading == false ? Text(title,style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),) : const CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}
