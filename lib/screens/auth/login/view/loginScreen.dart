import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/constant/colors.dart';
import 'package:weatherappdynamic/screens/auth/login/viewModal/LoginAuthViewModal.dart';
import 'package:weatherappdynamic/utils/customInputFields.dart';
import 'package:weatherappdynamic/utils/customPasswordFields.dart';
import 'package:weatherappdynamic/utils/custome_button.dart';

import '../../../../constant/colors.dart';
import '../../../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15.0),
        child: ListView(
          children: [
            AspectRatio(
                aspectRatio: 16/9,
                child: SvgPicture.asset("assets/svg/login_svg.svg")),
            Container(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "Login",style: Theme.of(context).textTheme.titleMedium,),
            ),
            const SizedBox(height: 20,),
            customInputFields(controller: _emailController,hintText: "Enter your email",keyboardType: TextInputType.emailAddress,prefixIcon: "assets/svg/email_outline.svg",),
            const SizedBox(height: 10,),
            Consumer<LoginAuthViewModal>(builder: (context, value, child) {
              return customPasswordFields(controller: _passwordController,obscure: value.isPasswordVisible, hintText: "Enter password",onTap: () {
                value.togglePasswordVisibility();
              },);
            },),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.forgotPass);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password ?",style: Theme.of(context).textTheme.labelMedium,),
                  Icon(Icons.arrow_right_alt,color: accentColor,)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            CustomButton(title: 'Login',onTap: () {
              if(_emailController.text.isEmpty && _passwordController.text.isEmpty ){
                Utils.toastMessage("Please fill required fields", errorColor);
              }else if(!_emailController.text.contains("@")){
                Utils.toastMessage("Please enter valid email address", errorColor);
              }else if (_passwordController.text.isEmpty){
                Utils.toastMessage("Please enter password", errorColor);
              }else if(_passwordController.text.length < 8){
                Utils.toastMessage("Please enter password at least 8 length", errorColor);
              }
              else{
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              }
            },),
            const SizedBox(height: 50,),
            InkWell(
              onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "I don't have an account ?",
                    style: Theme.of(context).textTheme.labelMedium,
                    children: [
                      TextSpan(
                        text: ' Sign Up',
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


