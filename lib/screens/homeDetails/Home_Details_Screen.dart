import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/screens/home/viewModal/homeViewModal.dart';
import 'package:weatherappdynamic/screens/homeDetails/homeDetailsVIewModal.dart';
import 'package:weatherappdynamic/utils/custome_button.dart';

class Home_Details_Screen extends StatefulWidget {
  final String productName;
  const Home_Details_Screen({super.key, required this.productName});

  @override
  State<Home_Details_Screen> createState() => _Home_Details_ScreenState();
}

class _Home_Details_ScreenState extends State<Home_Details_Screen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<HomeDetailViewModal>(builder: (context, value, child) {
        value.getProductData(widget.productName);
        setState(() {
        });
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 50.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back,)),
                Text("Product Details",style: Theme.of(context).textTheme.titleSmall),
                const Badge(
                  textStyle: TextStyle(fontSize: 14.0),
                  label: Text("1"),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ],),
            const SizedBox(height: 20,),
            AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            value.products["Image"]
                        ))
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.products["ProductTitle"],style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),),
                    Text.rich(
                        TextSpan(
                            text: "\$ ${value.products["Price"]} ",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
                            children: [
                              // TextSpan(
                              //     text: "${value.products["Description"]}",
                              //     style: Theme.of(context).textTheme.labelSmall
                              // )
                            ]
                        )
                    )
                  ],),
                InkWell(
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: productCardColor,
                      child: Image.asset("assets/icons/favorite.png",height: 27,width: 27,)
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Text("Description",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize:18,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),),
            const SizedBox(height : 10),
            Text(value.products["Description"],style: Theme.of(context).textTheme.labelSmall)
          ],
        );
      },),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: accentColor
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
              child: Text("Add to cart",style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                 border: Border.all(width: 1,color: textColor2)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
              child:  Text("Add to cart",style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            )
        ],),
      ),

    );
  }
}
