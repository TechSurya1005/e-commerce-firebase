import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Details_Screen extends StatefulWidget {
  final String cityName;
  const Home_Details_Screen({super.key, required this.cityName});

  @override
  State<Home_Details_Screen> createState() => _Home_Details_ScreenState();
}

class _Home_Details_ScreenState extends State<Home_Details_Screen> {
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
      child: ListView(
        children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("32\u00B0C",style: GoogleFonts.poppins(
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),),
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(CupertinoIcons.location_solid,color: Colors.white,),
                        Text(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                          widget.cityName,style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset("assets/images/sunny_cloudy.png",height: 120,width: 120,)
            ],),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade700.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.shade700.withOpacity(0.2),
                      blurRadius: 50
                    )
                  ]
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.visible,
                            "Low",style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),),
                          const Icon(Icons.sunny_snowing,color: Colors.white,)
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                        "UV Index",style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade700.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueAccent.shade700.withOpacity(0.2),
                            blurRadius: 50
                        )
                      ]
                  ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.visible,
                            "Low",style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),),
                          const Icon(Icons.sunny_snowing,color: Colors.white,)
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.visible,
                        "UV Index",style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.shade700.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueAccent.shade700.withOpacity(0.2),
                            blurRadius: 50
                        )
                      ]
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                              "Low",style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),),
                            const Icon(Icons.sunny_snowing,color: Colors.white,)
                          ],
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.visible,
                          "UV Index",style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                ),
            ],)
        ],
      ),
      )
    );
  }
}
