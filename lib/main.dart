import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/config/theme/app_theme.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/pages/buttomNavBar.dart';
import 'package:flutter_application_1/presentation/splash/pages/splash.dart';
import 'package:flutter_application_1/servise_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ecommerce_with_omar Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      home: SplashPage(),
    );
  }
}
