
import 'package:flutter/material.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/screens/auth/forgotPassword/view/forgotPassword.dart';
import 'package:weatherappdynamic/screens/auth/login/view/loginScreen.dart';
import 'package:weatherappdynamic/screens/auth/singUp/view/singUpScreen.dart';
import 'package:weatherappdynamic/screens/home/view/Home_Screen.dart';
import 'package:weatherappdynamic/screens/homeDetails/Home_Details_Screen.dart';
import 'package:weatherappdynamic/screens/profile/view/profile.dart';
import 'package:weatherappdynamic/screens/splash/Splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splash_Screen());
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home_Screen());
      case AppRoutes.homeMain:
        return MaterialPageRoute(
            builder: (BuildContext context) => Home_Details_Screen(
              productID: args.toString(),
            ));
      case AppRoutes.loginNumber:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case AppRoutes.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());
      case AppRoutes.forgotPass:
        return MaterialPageRoute(
            builder: (BuildContext context) => ForgotPassword());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (BuildContext context)=> ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
                child: Text(
              "No route defined",
              style: TextStyle(fontSize: 25,color: Colors.black),
            )),
          );
        });
    }
  }
}
