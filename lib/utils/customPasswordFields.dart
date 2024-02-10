import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/constant/colors.dart';

class customPasswordFields extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscure;
  final String hintText;
  final VoidCallback onTap;
  customPasswordFields({
    super.key, this.controller, required this.obscure, required this.hintText,required this.onTap,
  });

  final Widget svg1 = SvgPicture.asset(
    'assets/svg/eye_off_outline.svg',
    semanticsLabel: "visibility",
    // height: 14.71,
    // width: 14.53,
    color: hintColor,
  );
  final Widget svg2 = SvgPicture.asset(
    'assets/svg/visible_on.svg',
    semanticsLabel: "visibility",
    color: hintColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: borderColor),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        textAlign: TextAlign.left,
        maxLength: 8,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
            hintText: hintText,
            counterText: "",
            hintStyle: GoogleFonts.poppins(
              color: Theme.of(context).hintColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(onPressed: onTap, icon: obscure ? svg1  : svg2),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/password_outline.svg",
                height: 14.71,
                width: 14.53,
                color: hintColor,
              ),
            )
        ),
      ),
    );
  }
}