import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/data/modal/user.dart';
import 'package:weatherappdynamic/screens/auth/singUp/viewModal/RegisterAuthViewModal.dart';
import 'package:weatherappdynamic/utils/customInputFields.dart';
import 'package:weatherappdynamic/utils/customPasswordFields.dart';
import 'package:weatherappdynamic/utils/utils.dart';

import '../../../../constant/colors.dart';
import '../../../../utils/custome_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confrimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          AspectRatio(
              aspectRatio: 16 / 10,
              child: SvgPicture.asset("assets/svg/signUp_svg.svg")),
          Container(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              "Sign Up",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          customInputFields(
            controller: _nameController,
            hintText: "Enter your name",
            keyboardType: TextInputType.text,
            prefixIcon: "assets/svg/person_outline.svg",
          ),
          const SizedBox(
            height: 10,
          ),
          customInputFields(
            controller: _emailController,
            hintText: "Enter your email",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: "assets/svg/email_outline.svg",
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<RegisterAuthViewModal>(
            builder: (context, value, child) {
              return customPasswordFields(
                controller: _passwordController,
                obscure: value.isPasswordVisible,
                hintText: "Enter password",
                onTap: () {
                  value.togglePasswordVisibility();
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<RegisterAuthViewModal>(
            builder: (context, value, child) {
              return customPasswordFields(
                controller: _confrimPasswordController,
                obscure: value.isPasswordVisible,
                hintText: "Enter confirm password",
                onTap: () {
                  value.togglePasswordVisibility();
                },
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<RegisterAuthViewModal>(
            builder: (context, value, child) {
              return CustomButton(
                isLoading: value.isLoading,
                title: 'Sign Up',
                onTap: () async {
                  if (_nameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _confrimPasswordController.text.isEmpty) {
                    Utils.toastMessage(
                        "Please fill required fields", errorColor);
                  } else if (!_emailController.text.contains("@")) {
                    Utils.toastMessage("Please enter valid email", errorColor);
                  } else if (_confrimPasswordController.text !=
                      _passwordController.text) {
                    Utils.toastMessage(
                        "Password and confirm password not matching",
                        errorColor);
                  } else if (_passwordController.text.length < 8) {
                    Utils.toastMessage(
                        "Please enter password at least 8 character",
                        errorColor);
                  } else {
                    await value
                        .signUp(
                            UserData(
                                username: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text),
                            context)
                        .then((value) => (value) {
                              _nameController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _confrimPasswordController.clear();

                              return value;
                            });
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
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
                    ]),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
