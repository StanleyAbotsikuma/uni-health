// ignore: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/sharedpreference.dart';
import '../utils/utils.dart';

Future<void> SignIn(key, context, username, password) async {
  Map data = {
    "token": Constants.token,
    "password": Constants.password,
    "type": Constants.login,
    "userEmail": username,
    "userPassword": password
  };
  Response response;
  var dio = Dio();
  // print(data);
  response = await dio.post(Constants.url, data: data);

  if (kDebugMode) {
    print(response.data);
  }

  final payload = response.data;
  // /print(payload["message"]);
  if (payload["message"] == "success") {
    Sharepreference.instance.setBooleanValue(Constants.signIn, true);
    Sharepreference.instance
        .setStringValue(Constants.userId, payload["userId"]);
    Sharepreference.instance
        .setStringValue(Constants.userFirstName, payload["userFirstName"]);
    Sharepreference.instance
        .setStringValue(Constants.userLastName, payload["userLastName"]);
    Sharepreference.instance
        .setStringValue(Constants.userPhone, payload["userPhone"]);
    Sharepreference.instance
        .setStringValue(Constants.userEmail, payload["userEmail"]);
    Sharepreference.instance
        .setStringValue(Constants.userResidence, payload["userResidence"]);
    Sharepreference.instance.setStringValue(
        Constants.userCloseFirstName, payload["userCloseFirstName"]);
    Sharepreference.instance.setStringValue(
        Constants.userCloseLastName, payload["userCloseLastName"]);
    Sharepreference.instance
        .setStringValue(Constants.userClosePhone, payload["userClosePhone"]);
    final login =
        await Sharepreference.instance.getBooleanValue(Constants.signIn);
    if (login) {
      Navigator.pushNamedAndRemoveUntil(
          context, "/home_screen", (route) => false);
    }
  } else {
// ignore: deprecated_member_use
    // key.currentState!.showSnackBar(
    //   const SnackBar(
    //     content: Text(
    //       "Wrong Email or Password",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    //     ),
    //     duration: Duration(seconds: 2),
    //     backgroundColor: Colors.red,
    //   ),
    // );
  }
}
