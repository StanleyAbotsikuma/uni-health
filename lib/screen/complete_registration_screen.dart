import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:uni_health/utils/registration_provider.dart';

import '../configs/colors.dart';
import '../utils/utils.dart';

class CompleteRegistrationScreen extends StatefulWidget {
  const CompleteRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CompleteRegistrationScreen> createState() =>
      _CompleteRegistrationScreenState();
}

class _CompleteRegistrationScreenState
    extends State<CompleteRegistrationScreen> {
  TextEditingController userPassword = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  String passwordStatus = "";

  void checkPassword() {
    if (userPassword.text.trim() != "") {
      if (userPassword.text == repeatPassword.text) {
        setState(() {
          passwordStatus = "Password Matched";
        });
      } else {
        setState(() {
          passwordStatus = "Password Unmatched";
        });
      }
    } else {
      setState(() {
        passwordStatus = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Consumer<RegistrationProvider>(
        builder: (context, registrationProvider, child) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: GetColor.PrimaryColor,
              image: DecorationImage(
                image: AssetImage('assets/images/background_pattern_1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GetColor.whiteColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 30.w, horizontal: 20.h),
                padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "Register Account ",
                            style: TextStyle(
                                color: GetColor.PrimaryColor,
                                fontSize: 25.sp,
                                fontFamily: "inter",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " Step 3/3",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.sp,
                                fontFamily: "inter",
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Gap(10),
                      // const Divider(color: Color.fromARGB(255, 141, 147, 163)),
                      const Gap(30),
                      TextField(
                        controller: userPassword,
                        onChanged: (value) => {checkPassword()},
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Password",
                            fillColor: Colors.white70),
                      ),
                      const Gap(15),
                      Text(
                        passwordStatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: passwordStatus == "Password Matched"
                                ? Colors.green[900]
                                : Colors.red,
                            fontSize: 15.sp,
                            fontFamily: "inter",
                            fontWeight: FontWeight.w200),
                      ),
                      const Gap(10),
                      TextField(
                        controller: repeatPassword,
                        onChanged: (value) => {checkPassword()},
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Repeat Password",
                            fillColor: Colors.white70),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        height: 70.h,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        GetColor.PrimaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            color: GetColor.PrimaryColor)))),
                            // ignore: avoid_returning_null_for_void
                            onPressed: () {
                              if (userPassword.text.trim() == "") {
                              } else if (repeatPassword.text.trim() == "") {
                              } else {
                                if (userPassword.text == repeatPassword.text) {
                                  registrationProvider.setStep3(
                                      userPassword: userPassword.text);
                                  if (registrationProvider.getCompleteStep3() &&
                                      registrationProvider.getCompleteStep2() &&
                                      registrationProvider.getCompleteStep1()) {
                                    Future<void> Signup() async {
                                      Map data = {
                                        "token": Constants.token,
                                        "password": Constants.password,
                                        "type": Constants.register,
                                        "userFirstName": registrationProvider
                                            .getUserFirstName(),
                                        "userLastName": registrationProvider
                                            .getUserLastName(),
                                        "userPhone":
                                            registrationProvider.getUserPhone(),
                                        "userEmail":
                                            registrationProvider.getUserEmail(),
                                        "userResidence": registrationProvider
                                            .getUserResidence(),
                                        "userCloseFirstName":
                                            registrationProvider
                                                .getUserCloseFirstName(),
                                        "userCloseLastName":
                                            registrationProvider
                                                .getUserCloseLastName(),
                                        "userClosePhone":
                                            registrationProvider.getUserPhone(),
                                        "userPassword": registrationProvider
                                            .getUserPassword()
                                      };
                                      Response response;
                                      var dio = Dio();
                                      // print(data);
                                      response = await dio.post(Constants.url,
                                          data: data);

                                      if (kDebugMode) {
                                        print(response.data);
                                      }

                                      final payload = response.data;
                                      // /print(payload["message"]);
                                      if (payload["message"] == "success") {
                                        // ignore: use_build_context_synchronously
                                        SignIn();
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            "/home_screen",
                                            (route) => false);
                                      } else {}
                                    }

                                    Signup();
                                    //signup function

                                  }
                                }
                              }
                            },
                            child: Text("Register".toUpperCase(),
                                style: const TextStyle(fontFamily: "inter"))),
                      ),
                      const Gap(30),
                      const Divider(color: Color.fromARGB(255, 141, 147, 163)),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: "inter",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void SignIn() {}
}
