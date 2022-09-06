import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/colors.dart';
import '../configs/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _visible = false;
      });
      Navigator.pushNamedAndRemoveUntil(
          context, "/welcome_screen", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GetColor.whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/images/background_pattern_1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          height: 249.w,
          width: double.infinity,
          color: GetColor.whiteColor,
          child: Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.1,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                GetImages.logo,
                width: 249.w,
                height: 249.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
