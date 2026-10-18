import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:movie_app/ui/auth/login/login_screen.dart';
import 'package:movie_app/ui/auth/register/register_screen.dart';
import 'package:movie_app/ui/home/home_screen.dart';
import 'package:movie_app/ui/onboarding/onboarding_screen.dart';
import 'package:movie_app/utils/app_theme.dart';

import 'firebase_options.dart';
import 'utils/app_routes.dart';

Future<void> main() async {
  // lazem el 2 satreen dool 3ashan el Firebase yeshtaghal abl runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // el theme bta3 Mariam (khalfeya sooda w app bar shafaf)
      theme: AppTheme.darkTheme,

      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.onboardingRouteName: (context) => const OnboardingScreen(),
        AppRoutes.loginRouteName: (context) => const LoginScreen(),
        AppRoutes.registerRouteName: (context) => const RegisterScreen(),
        AppRoutes.forgetPasswordRouteName: (context) =>
            const ForgetPasswordScreen(),
        AppRoutes.homeRouteName: (context) => const HomeScreen(),
      },
    );
  }
}
