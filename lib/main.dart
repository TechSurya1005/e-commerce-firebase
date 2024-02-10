import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/app/routes/routes_call.dart';
import 'package:weatherappdynamic/app/theme/themes.dart';
import 'package:weatherappdynamic/screens/auth/forgotPassword/viewModal/forgotViewModal.dart';
import 'package:weatherappdynamic/screens/homeDetails/homeDetailsVIewModal.dart';
import 'firebase_options.dart';
import 'repository/counter_provider.dart';
import 'screens/auth/login/viewModal/LoginAuthViewModal.dart';
import 'screens/auth/singUp/viewModal/RegisterAuthViewModal.dart';
import 'screens/home/viewModal/homeViewModal.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // runApp(DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp()));
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => LoginAuthViewModal()),
          ChangeNotifierProvider(create: (_) => RegisterAuthViewModal()),
          ChangeNotifierProvider(create: (_) => HomeViewModal()),
          ChangeNotifierProvider(create: (_) => HomeDetailViewModal()),
          ChangeNotifierProvider(create: (_) => ForgotPasswordViewModal()),
        ],
        child: MaterialApp(
          title: "E-Commerce",
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}

