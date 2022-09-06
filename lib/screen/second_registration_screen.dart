import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../configs/colors.dart';
import '../configs/images.dart';

class SecondRegistrationScreen extends StatelessWidget {
  const SecondRegistrationScreen({Key? key}) : super(key: key);

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
                        " Step 2/3",
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
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Place Of Residence",
                        fillColor: Colors.white70),
                  ),
                  const Gap(30),
                  Text(
                    "** Please you are required to fill in the information of any close relative ** ",
                    style: TextStyle(
                        // color:,
                        fontSize: 14.sp,
                        fontFamily: "inter",
                        fontWeight: FontWeight.w100),
                  ),
                  const Gap(20),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "First Name (Close Relative)",
                        fillColor: Colors.white70),
                  ),
                  const Gap(10),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Last Name (Close Relative)",
                        fillColor: Colors.white70),
                  ),
                  const Gap(10),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Phone Number (Close Relative)",
                        fillColor: Colors.white70),
                  ),
                  const Gap(10),
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                        color: GetColor.PrimaryColor)))),
                        // ignore: avoid_returning_null_for_void
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/complete_registration_screen");
                        },
                        child: Text("Continue".toUpperCase(),
                            style: const TextStyle(fontFamily: "inter"))),
                  ),
                  const Gap(30),
                  const Divider(color: Color.fromARGB(255, 141, 147, 163)),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (kDebugMode) {
                          print("Sign ACcoutn");
                        }
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
      ),
    );
  }
}
