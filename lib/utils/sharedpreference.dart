import 'package:shared_preferences/shared_preferences.dart';

class Sharepreference {
  factory Sharepreference() {
    return SharedPreferences.getInstance();
  }

  static Sharepreference _instance = Sharepreference._();

  Sharepreference._();
}
