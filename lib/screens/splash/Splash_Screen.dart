import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherappdynamic/app/theme/themes.dart';
import 'package:weatherappdynamic/main.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      if(box.read("isLogged")==true){
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }else{
        Navigator.pushReplacementNamed(context, AppRoutes.loginNumber);
      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
                aspectRatio: 13/9,
                child: SvgPicture.asset(
                    "assets/svg/splash_svg.svg",
                    semanticsLabel: 'Acme Logo'
                )),
            const SizedBox(
              height: 20,
            ),
            Text("E-Commerce",style: Theme.of(context).textTheme.titleLarge)
          ],
        ),
      ),
    );
  }
}
