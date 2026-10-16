import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/home_screen.dart';
import 'package:movie_app/ui/onboarding/onboarding_screen.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.onboardingRouteName: (context) => OnboardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
      },
    );
  }
}
