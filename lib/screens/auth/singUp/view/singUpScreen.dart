import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/screens/auth/singUp/viewModal/RegisterAuthViewModal.dart';
import 'package:weatherappdynamic/utils/customInputFields.dart';
import 'package:weatherappdynamic/utils/customPasswordFields.dart';

import '../../../../constant/colors.dart';
import '../../../../utils/custome_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15.0),
          child: ListView(
            children: [
              const SizedBox(height: 30,),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              AspectRatio(
                  aspectRatio: 16/10,
                  child: SvgPicture.asset("assets/svg/signUp_svg.svg")),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Sign Up",style: Theme.of(context).textTheme.titleMedium,),
              ),
              const SizedBox(height: 20,),
              const customInputFields(hintText: "Enter your name",keyboardType: TextInputType.text,prefixIcon: "assets/svg/person_outline.svg",),
              const SizedBox(height: 10,),
              const customInputFields(hintText: "Enter your email",keyboardType: TextInputType.emailAddress,prefixIcon: "assets/svg/email_outline.svg",),
              const SizedBox(height: 10,),
              Consumer<RegisterAuthViewModal>(builder: (context, value, child) {
                return customPasswordFields(obscure: value.isPasswordVisible, hintText: "Enter password",onTap: () {
                  value.togglePasswordVisibility();
                },);
              },),
              const SizedBox(height: 10,),
              Consumer<RegisterAuthViewModal>(builder: (context, value, child) {
                return customPasswordFields(obscure: value.isPasswordVisible, hintText: "Enter confirm password",onTap: () {
                  value.togglePasswordVisibility();
                },);
              },),
              const SizedBox(height: 10,),
              CustomButton(title: 'Sign Up',onTap: () {
              },),
              const SizedBox(height: 50,),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginNumber);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                        text: "I've already an account?",
                        style: Theme.of(context).textTheme.labelMedium,
                        children: [
                          TextSpan(
                            text: ' LogIn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

