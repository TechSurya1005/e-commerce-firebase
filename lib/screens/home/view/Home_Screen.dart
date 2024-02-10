import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/screens/home/viewModal/homeViewModal.dart';
import 'package:weatherappdynamic/utils/custome_button.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  // List<Map<String, dynamic>> category = [
  //   {"title": "Fashion", "icon": "assets/icons/faishon.png"},
  //   {"title": "School", "icon": "assets/icons/school.png"},
  //   {"title": "Sports", "icon": "assets/icons/sports.png"},
  //   {"title": "Mobile", "icon": "assets/icons/mobile.png"},
  // ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()=> Navigator.pushNamed(context, AppRoutes.profile),
                  child: CircleAvatar(
                    backgroundColor: accentColor,
                    backgroundImage: const NetworkImage(
                        "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                  ),
                ),
                const Spacer(),
                Text(
                  "Shopping",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                const Badge(
                  textStyle: TextStyle(fontSize: 14.0),
                  label: Text("1"),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<HomeViewModal>(builder: (context, value, child) {
            value.getData();
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: value.categories.take(4).map((e) {
                      return InkWell(
                        onTap: () {
                          value.toggleCatTitle(e.categoryTitle.toString());
                          value.getProductData(value.catTitle);
                        },
                        child: Column(
                          children: [
                            // Add your category content here
                            Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Colors.grey.shade200),
                                child: Image.network(
                                  e.image,
                                  fit: BoxFit.contain,
                                  width: 30,
                                  height: 30,
                                )),
                            const SizedBox(height: 8.0),
                            Text(
                              e.categoryTitle.toString(),
                              style: TextStyle(
                                color: textColor2,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 0),
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.grey.shade200),
                            child: Image.asset(
                              "assets/icons/all.png",
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            )),
                        const SizedBox(height: 10.0),
                        Text(
                          "All",
                          style: TextStyle(
                            color: textColor2,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },),
          Consumer<HomeViewModal>(builder: (context, value, child) {
            value.getProductData(value.catTitle);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              itemCount: value.products.length, // Replace with your actual item count
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  crossAxisCount: 2,
                  mainAxisExtent: size.width / 1.6
              ),
              itemBuilder: (context, index) {
                // Replace with your item widget
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.homeMain,arguments: value.products[index].productTitle);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16/9,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0)),
                                  color: textColor2,
                              ),
                              child: AspectRatio(
                                  aspectRatio: 16/9,
                                  child: Image.network(value.products[index].image.toString(),fit: BoxFit.contain,)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: 150,
                              child: Text(
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.visible,
                                value.products[index].productTitle.toString(),
                                style: Theme.of(context).textTheme.labelSmall,
                              )),
                          Text(
                            "\$ ${value.products[index].price}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Spacer(),
                          const CustomButton(isLoading: false,title: "Add to cart")
                        ],
                      ),
                    ));
              },
            );
          },)
        ],
      ),
    ));
  }
}
