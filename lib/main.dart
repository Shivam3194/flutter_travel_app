import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_app/custom_files/app_colors.dart';
import 'package:flutter_travel_app/ui/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedBlue),
      ),
      home: const SplashScreen(),
    );
  }
}

const spinkit = SpinKitChasingDots(
  color: AppColors.blue,
  size: 40.0,
);
