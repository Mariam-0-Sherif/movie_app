import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:movie_app/ui/auth/login/login_screen.dart';
import 'package:movie_app/ui/auth/register/register_screen.dart';
import 'package:movie_app/ui/home/home_screen.dart';
import 'package:movie_app/ui/onboarding/onboarding_screen.dart';
import 'package:movie_app/utils/app_theme.dart';
import 'package:movie_app/ui/update_profile/update_profile_screen.dart';
import 'firebase_options.dart';
import 'utils/app_routes.dart';

Future<void> main() async {
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
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.onboardingRouteName: (context) =>  OnboardingScreen(),
        AppRoutes.loginRouteName: (context) =>  LoginScreen(),
        AppRoutes.registerRouteName: (context) =>  RegisterScreen(),
        AppRoutes.forgetPasswordRouteName: (context) =>  ForgetPasswordScreen(),
        AppRoutes.homeRouteName: (context) =>  HomeScreen(),
        AppRoutes.updateProfileRouteName: (context) => UpdateProfileScreen(),
      },
      theme: AppTheme.darkTheme,
    );
  }
}
