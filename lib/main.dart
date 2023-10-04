import 'package:flutter/material.dart';
import 'package:food_delivery_app/config/app_router.dart';

import 'config/locator.dart';
import 'config/theme.dart';
import 'screens/home/home_screen.dart';

void main() async {
  await Locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
