import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/constant/colors.dart';

class customInputFields extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final String prefixIcon;
  const customInputFields({
    super.key, required this.hintText, required this.keyboardType, required this.prefixIcon, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: borderColor),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: Theme.of(context).hintColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                prefixIcon,
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