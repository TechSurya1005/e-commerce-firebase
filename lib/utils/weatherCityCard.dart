import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherCityCart extends StatelessWidget {
  WeatherCityCart({
    super.key,
    required this.size, required this.weatherImage, required this.degree, required this.cityName,
  });

  final Size size;
  final String weatherImage;
  final String degree;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.blueAccent,
        image: const DecorationImage(image: AssetImage("assets/images/cities.png"),fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.black
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(weatherImage,height: 50,width: 50,),
              const SizedBox(height: 10,),
              Text("$degree\u00B0C",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: Colors.white
                ),
              ),
              SizedBox(
                width: size.width * 0.2,
                child: Text(cityName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              ),
            ],),
        ),
      ),
    );
  }
}