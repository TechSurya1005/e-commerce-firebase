import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/utils/customInputFields.dart';
import 'package:weatherappdynamic/utils/custome_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15.0),
          child: ListView(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              AspectRatio(
                  aspectRatio: 16/9,
                  child: SvgPicture.asset("assets/svg/forgotPass_svg.svg")),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Forgot Password",style: Theme.of(context).textTheme.titleMedium,),
              ),
              const SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  "Please, enter your email address. You will receive a link to create a new password via email.",style: Theme.of(context).textTheme.labelSmall,),
              ),
              const SizedBox(height: 20,),
              const customInputFields(hintText: "Enter your email",keyboardType: TextInputType.emailAddress,prefixIcon: "assets/svg/email_outline.svg",),
              const SizedBox(height: 30,),
              CustomButton(title: 'Submit',onTap: () {
              },),
              const SizedBox(height: 50,),
            ],
          ),
        )
    );
  }
}
