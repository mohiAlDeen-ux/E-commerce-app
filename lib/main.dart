import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/internet/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/theme/app_theme.dart';
import 'presentation/bottomNavBar/pages/buttomNavBar.dart';
import 'presentation/splash/pages/splash.dart';
import 'servise_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit()..monitorInternetConnection(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ecommerce app by The Flutter Way',
        theme: AppTheme.lightTheme(context),
        home: BottomNavBarPage(),
      ),
    );
  }
}
