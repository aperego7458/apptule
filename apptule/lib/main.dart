import 'package:apptule/config/app_colors.dart';
import 'package:apptule/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Software Ganadero',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.primaryCream),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
