import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:uni_health/utils/registration_provider.dart';

import '../configs/colors.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController userFirstName = TextEditingController();
  TextEditingController userLastName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Consumer<RegistrationProvider>(
        builder: (context, registrationProvider, child) {
          userFirstName.text = registrationProvider.getUserFirstName();
          userLastName.text = registrationProvider.getUserLastName();
          userPhone.text = registrationProvider.getUserPhone();
          userEmail.text = registrationProvider.getUserEmail();

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
                            " Step 1/3",
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
                        controller: userFirstName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.perm_identity),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "First Name",
                            fillColor: Colors.white70),
                      ),
                      const Gap(10),
                      TextField(
                        controller: userLastName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.perm_identity),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Last Name",
                            fillColor: Colors.white70),
                      ),
                      const Gap(10),
                      TextField(
                        controller: userPhone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Phone Number",
                            fillColor: Colors.white70),
                      ),
                      const Gap(10),
                      TextField(
                        controller: userEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "E-Mail",
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
                              if (userFirstName.text.trim() == "") {
                              } else if (userLastName.text.trim() == "") {
                              } else if (userPhone.text.trim() == "") {
                              } else if (userEmail.text.trim() == "") {
                              } else {
                                registrationProvider.setStep1(
                                    userFirstName:
                                        userFirstName.text.toUpperCase(),
                                    userLastName:
                                        userLastName.text.toUpperCase(),
                                    userPhone: userPhone.text,
                                    userEmail: userEmail.text);
                                if (registrationProvider.getCompleteStep1()) {
                                  Navigator.pushNamed(
                                      context, "/second_registration_screen");
                                }
                              }
                            },
                            child: Text("Continue".toUpperCase(),
                                style: const TextStyle(fontFamily: "inter"))),
                      ),
                      const Gap(30),
                      const Divider(color: Color.fromARGB(255, 141, 147, 163)),
                      const Center(
                        child: Text(
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            if (kDebugMode) {
                              print("Sign ACcoutn");
                            }
                          },
                          child: const Text(
                            "Sign-In",
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
}
