import 'package:flutter/material.dart';
import 'package:uni_health/screen/appointment_screen.dart';
import 'package:uni_health/screen/complete_registration_screen.dart';
import 'package:uni_health/screen/doctor_screen.dart';
import 'package:uni_health/screen/feedback_screen.dart';
import 'package:uni_health/screen/medication_screen.dart';
import 'package:uni_health/screen/profile_screen.dart';
import 'package:uni_health/screen/records_screen.dart';
import 'package:uni_health/screen/registration_screen.dart';
import 'package:uni_health/screen/tips_screen.dart';
import 'package:uni_health/screen/welcome_screen.dart';

import '../screen/home_screen.dart';
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
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case "/complete_registration_screen":
        return MaterialPageRoute(builder: (_) => CompleteRegistrationScreen());
      case "/second_registration_screen":
        return MaterialPageRoute(builder: (_) => SecondRegistrationScreen());
      case "/home_screen":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/profile_screen":
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case "/appointment_screen":
        return MaterialPageRoute(builder: (_) => AppointmentScreen());
      case "/records_screen":
        return MaterialPageRoute(builder: (_) => RecordScreen());
      case "/medication_screen":
        return MaterialPageRoute(builder: (_) => MedicationScreen());
      case "/doctor_screen":
        return MaterialPageRoute(builder: (_) => DoctorScreen());
      case "/feedback_screen":
        return MaterialPageRoute(builder: (_) => FeedBackScreen());
      case "/tips_screen":
        return MaterialPageRoute(builder: (_) => TipsScreen());

//firebase_auth
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
