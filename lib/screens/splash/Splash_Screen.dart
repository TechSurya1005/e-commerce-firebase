import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/blur_bg.jpg",),fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AspectRatio(
                aspectRatio: 16/9,
                child: Image(image: AssetImage("assets/images/weatherPNG.png"),fit: BoxFit.contain,)),
            const SizedBox(
              height: 20,
            ),
            Text("WeatherApp",style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }
}
