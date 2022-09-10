import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../configs/colors.dart';
import '../configs/images.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
        ),
        centerTitle: true,
        title: const Text("Appointments"),
        actions: [],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
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
                      children: [],
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
}
