import 'package:flutter/material.dart';
import 'package:uni_health/screen/complete_registration_screen.dart';
import 'package:uni_health/screen/registration_screen.dart';
import 'package:uni_health/screen/welcome_screen.dart';

import '../screen/second_registration_screen.dart';
import '../screen/splash_screen.dart';

class GenerateRoute {
  //onGenerateRoute init
  static Route? onGenerateRoute(RouteSettings settings) {
    //pagePath
    String? pagePath = settings.name;

    switch (pagePath) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/welcome_screen":
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case "/registration_screen":
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case "/complete_registration_screen":
        return MaterialPageRoute(
            builder: (_) => const CompleteRegistrationScreen());
      case "/second_registration_screen":
        return MaterialPageRoute(
            builder: (_) => const SecondRegistrationScreen());
      case "/home_screen":
        return MaterialPageRoute(
            builder: (_) => const SecondRegistrationScreen());

//firebase_auth
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
