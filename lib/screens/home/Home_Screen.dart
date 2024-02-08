import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/utils/weatherCityCard.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/blur_bg.jpg"),fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2), // Shadow color
                          blurRadius: 10,
                          spreadRadius: 5,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/cloudy.png",
                            height: 27,
                            width: 27,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Ravathpura Phase II",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.sunny,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: 20, // Replace with your actual item count
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _getCrossAxisCount(context),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      // Replace with your item widget
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.homeMain,arguments: "Civil Line Raipur" );
                          },
                          child: WeatherCityCart(size: size, weatherImage: 'assets/icons/weather.png', degree: '32', cityName: 'Civil Line Raipur',));
                    },
                  ),
                ),
              ],
            )));
  }

  int _getCrossAxisCount(BuildContext context) {
    // Determine the number of columns based on screen width
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        (screenWidth / 180).round(); // Adjust 150 according to your item width
    return crossAxisCount;
  }
}


