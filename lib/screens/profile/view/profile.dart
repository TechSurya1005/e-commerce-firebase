import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/utils/customInputFields.dart';
import 'package:weatherappdynamic/utils/custome_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String selectedGender = "Male";

  TextEditingController _nameController  = TextEditingController();
  TextEditingController _emailController  = TextEditingController();
  TextEditingController _mobileController  = TextEditingController();
  TextEditingController _ageController  = TextEditingController();

  @override
  void initState() {
    _nameController.text = "Suryakant Ajay";
    _emailController.text = "Surya@gmail.com";
    _mobileController.text = "7869308919";
    _ageController.text = "25";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Text("Profile",style: Theme.of(context).textTheme.titleSmall,),
                  IconButton(onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginNumber, (route) => false);
                  }, icon: const Icon(Icons.logout,size: 27,))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              // height: size.height * 0.3,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: accentColor,
                           child: const CircleAvatar(
                             radius: 58,
                             backgroundImage: NetworkImage(
                                 "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                           )
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 10,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: accentColor,
                            child: const Icon(Icons.edit,color: Colors.white,size: 15,),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    child: Column(children: [
                      const SizedBox(height: 10,),
                      Text("Suryakant Ajay",style: Theme.of(context).textTheme.titleSmall,),
                      const SizedBox(height: 10,),
                      Text("+91 7869308919",style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: textColor2
                      )),
                    ],),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex:1,
                child: SingleChildScrollView(
                  child: Container(
                                height: size.height,
                                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0,-3),
                      blurRadius: 10,
                    )
                  ]
                                ),
                                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // padding: EdgeInsets.zero,
                    children: [
                      Text(textAlign:TextAlign.center ,"More Details",style: Theme.of(context).textTheme.titleSmall,),
                      const SizedBox(height: 10,),
                      customInputFields(controller: _nameController,hintText: "Name", keyboardType: TextInputType.text, prefixIcon: "assets/svg/person_outline.svg"),
                      const SizedBox(height: 10,),
                      // const customInputFields(hintText: "Email", keyboardType: TextInputType.emailAddress, prefixIcon: "assets/svg/email_outline.svg"),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: borderColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.labelMedium,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset("assets/svg/email_outline.svg",height: 15,width: 15,color: textColor2,)
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: borderColor),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: TextFormField(
                      controller: _mobileController,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        counterText: "",
                          hintText: "Number",
                          hintStyle: GoogleFonts.poppins(
                            color: Theme.of(context).hintColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.call,color: textColor2,)
                          )
                      ),
                    ),
                  ),
                      const SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: borderColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Gender: ",style: Theme.of(context).textTheme.labelSmall,),
                              Text("Male",style: Theme.of(context).textTheme.labelSmall,),
                              Radio(
                                fillColor: MaterialStatePropertyAll(accentColor),
                                value: "Male", groupValue: selectedGender, onChanged: (value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                              },),
                              Text("Fe-Male",style: Theme.of(context).textTheme.labelSmall,),
                              Radio(
                                fillColor: MaterialStatePropertyAll(accentColor),
                                value: "Female", groupValue: selectedGender, onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: borderColor),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: TextFormField(
                          controller: _ageController,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          maxLength: 2,
                          style: Theme.of(context).textTheme.labelMedium,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: "Age",
                              hintStyle: GoogleFonts.poppins(
                                color: Theme.of(context).hintColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.real_estate_agent,color: textColor2,)
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height:20),
                      const CustomButton(title: "Update")
                  ],),
                                ),
                              ),
                ))
          ],
        ),
      ),
    );
  }
}
