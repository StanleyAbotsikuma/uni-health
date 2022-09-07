import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  // String
  String userFirstName = "";
  String userLastName = "";
  String userPhone = "";
  String userEmail = "";
  bool completeStep1 = false;

  String userResidence = "";
  String userCloseFirstName = "";
  String userCloseLastName = "";
  String userClosePhone = "";
  bool completeStep2 = false;

  String userPassword = "";
  bool completeStep3 = false;

  void setStep1({
    required String userFirstName,
    required String userLastName,
    required String userPhone,
    required String userEmail,
  }) {
    this.userFirstName = userFirstName;
    this.userLastName = userLastName;
    this.userPhone = userPhone;
    this.userEmail = userEmail;
    completeStep1 = true;
    notifyListeners();
  }

  void setStep2(
      {required String userResidence,
      required String userCloseFirstName,
      required String userCloseLastName,
      required String userClosePhone}) {
    this.userResidence = userResidence;
    this.userCloseFirstName = userCloseFirstName;
    this.userCloseLastName = userCloseLastName;
    this.userClosePhone = userClosePhone;
    completeStep2 = true;
    notifyListeners();
  }

  void setStep3({required String userPassword}) {
    this.userPassword = userPassword;
    completeStep3 = true;
    notifyListeners();
  }

  void clearAll() {
    userFirstName = "";
    userLastName = "";
    userPhone = "";
    userEmail = "";
    completeStep1 = false;
    userResidence = "";
    userCloseFirstName = "";
    userCloseLastName = "";
    userClosePhone = "";
    completeStep2 = false;
    userPassword = "";
    completeStep3 = false;
  }

  String getUserFirstName() {
    return userFirstName;
  }

  String getUserLastName() {
    return userLastName;
  }

  String getUserEmail() {
    return userEmail;
  }

  String getUserPhone() {
    return userPhone;
  }

  String getUserResidence() {
    return userResidence;
  }

  String getUserCloseFirstName() {
    return userCloseFirstName;
  }

  String getUserCloseLastName() {
    return userCloseLastName;
  }

  String getUserClosePhone() {
    return userClosePhone;
  }

  String getUserPassword() {
    return userPassword;
  }

  bool getCompleteStep1() {
    return completeStep1;
  }

  bool getCompleteStep2() {
    return completeStep2;
  }

  bool getCompleteStep3() {
    return completeStep3;
  }
}
