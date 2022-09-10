import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../configs/colors.dart';
import '../configs/images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Container(
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
            padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 30.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Center(
                    child: Image.asset(
                      GetImages.logo2,
                      width: 150.w,
                      height: 150.w,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    "Hello,",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "inter",
                        fontWeight: FontWeight.w100),
                  ),
                  //
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: GetColor.PrimaryColor,
                        fontSize: 35.sp,
                        fontFamily: "inter",
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(40),
                  TextField(
                    controller: userEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "E-mail",
                        fillColor: Colors.white70),
                  ),
                  const Gap(10),
                  TextField(
                    controller: userPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
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
                  const Gap(20),
                  SizedBox(
                    width: double.infinity,
                    height: 70.h,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              GetColor.PrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  color: GetColor.PrimaryColor),
                            ),
                          ),
                        ),
                        // ignore: avoid_returning_null_for_void
                        onPressed: () {
                          if (userEmail.text.trim() == "") {
                          } else if (userPassword.text.trim() == "") {
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home_screen", (route) => false);
                          }
                        },
                        child: Text("Login".toUpperCase(),
                            style: const TextStyle(fontFamily: "inter"))),
                  ),
                  const Gap(30),
                  const Divider(color: Color.fromARGB(255, 141, 147, 163)),
                  const Center(
                    child: Text(
                      "You do not have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "inter",
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/registration_screen");
                      },
                      child: const Text(
                        "Register Account",
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
      ),
    );
  }
}
