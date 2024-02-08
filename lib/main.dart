import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:weatherappdynamic/app/routes/routes.dart';
import 'package:weatherappdynamic/app/routes/routes_call.dart';
import 'repository/counter_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
  // runApp(DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
        ],
        child: MaterialApp(
          title: "E-Commerce",
          theme: ThemeData(
              useMaterial3: false
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: Routes.generateRoutes,
        ));
  }
}

