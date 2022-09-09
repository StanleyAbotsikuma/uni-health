import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:uni_health/configs/colors.dart';

import '../configs/images.dart';
import '../utils/local_Authenication.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool overlay = false;
  @override
  void initState() {
    authFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 30.sp,
          ),
        ),
        centerTitle: true,
        title: Center(
          child: Image.asset(
            GetImages.white,
            width: 100.w,
            height: 80.h,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              size: 30.sp,
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        overlay
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.amberAccent,
              )
            : Container(
                child: null,
              ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: GetColor.PrimaryColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/background_pattern_1.png'),
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 35.h),
                  child: Text(
                    "Hi,",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: GetColor.whiteColor,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, bottom: 20.w, top: 1.h),
                  child: Text(
                    "Stanley",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontFamily: "inter",
                      fontWeight: FontWeight.bold,
                      color: GetColor.whiteColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: GetColor.whiteColor,
                    ),
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: GetColor.PrimaryLightColor,
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/background_pattern_1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15,
                                ),
                                child: Text(
                                  "Welcome to Uni-Health",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.bold,
                                    color: GetColor.PrimaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 15,
                                ),
                                child: Text(
                                  "we are a platform  designed to keep records of medical diagnosis so that doctors and individuals can get access",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "inter",
                                    color: GetColor.PrimaryColor,
                                  ),
                                ),
                              ),
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: const BorderSide(
                                                  color:
                                                      GetColor.PrimaryColor)))),
                                  // ignore: avoid_returning_null_for_void
                                  onPressed: () {},
                                  child: const Text("Dismiss"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(20.w),
                        Expanded(
                          child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.h,
                                      crossAxisSpacing: 10.w),
                              children: [
                                home_button(),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget home_button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: GetColor.PrimaryColor, //background color of button

        //elevation of button
        shape: RoundedRectangleBorder(
            //to set border radius to button
            borderRadius: BorderRadius.circular(20.w)),
        //  padding: EdgeInsets.all(20) //content padding inside button
      ),
      // ignore: avoid_returning_null_for_void
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            GetImages.white,
            width: 80.w,
            height: 80.w,
          ),
          const Text(
            "Book Appoint",
            style: TextStyle(fontFamily: "inter"),
          )
        ],
      ),
    );
  }
}
