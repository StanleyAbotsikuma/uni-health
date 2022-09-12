import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';

import '../configs/colors.dart';
import '../utils/sharedpreference.dart';
import '../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userFirstName = "";
  String userLastName = "";
  String userPhone = "";
  String userEmail = "";
  String userResidence = "";
  String userCloseFirstName = "";
  String userCloseLastName = "";
  String userClosePhone = "";
  String userId = "";
  String firstLetter = " ";
  void load() async {
    final userFirstName =
        await Sharepreference.instance.getStringValue(Constants.userFirstName);
    final userLastName =
        await Sharepreference.instance.getStringValue(Constants.userLastName);
    final userPhone =
        await Sharepreference.instance.getStringValue(Constants.userPhone);
    final userEmail =
        await Sharepreference.instance.getStringValue(Constants.userEmail);
    final userResidence =
        await Sharepreference.instance.getStringValue(Constants.userResidence);
    final userCloseFirstName = await Sharepreference.instance
        .getStringValue(Constants.userCloseFirstName);
    final userCloseLastName = await Sharepreference.instance
        .getStringValue(Constants.userCloseLastName);
    final userClosePhone =
        await Sharepreference.instance.getStringValue(Constants.userClosePhone);
    final userId =
        await Sharepreference.instance.getStringValue(Constants.userId);

    // final lN =
    // await Sharepreference.instance.getStringValue(Constants.userLastName);
    // final lS = await Sharepreference.instance.getStringValue(Constants.userId);
    setState(() {
      this.userFirstName = userFirstName;
      this.userLastName = userLastName;
      this.userPhone = userPhone;
      this.userEmail = userEmail;
      this.userResidence = userResidence;
      this.userCloseFirstName = userCloseFirstName;
      this.userCloseLastName = userCloseLastName;
      this.userClosePhone = userClosePhone;
      this.userClosePhone = userClosePhone;
      this.userId = userId;

      //userId = lS;

      firstLetter = userFirstName[0];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
          ),
        ),
        centerTitle: true,
        title: const Text("Profile"),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(20),
                        Center(
                          child: SizedBox(
                            width: 120.w,
                            height: 120.w,
                            child: CircleAvatar(
                              backgroundColor: GetColor.PrimaryColor,
                              child: Text(
                                firstLetter,
                                style: const TextStyle(
                                    fontSize: 40.0, color: Colors.white),
                              ) //Text
                              ,
                            ),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(children: [
                              cardL(userId, "USER ID"),
                              cardL(userFirstName, "FIRST NAME"),
                              cardL(userLastName, "LAST NAME"),
                              cardL(userPhone, "PHONE"),
                              cardL(userEmail, "E-MAIL"),
                              const Gap(10),
                              Divider(),
                              Text("CLOSE RELATIVE"),
                              cardL(userCloseFirstName, "FIRST NAME"),
                              cardL(userCloseLastName, "LAST NAME"),
                              cardL(userClosePhone, "PHONE NAME"),
                            ]),
                          ),
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

  Widget cardL(head, subhead) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 2,
      child: ListTile(
        horizontalTitleGap: 20.w,
        minVerticalPadding: 15.w,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            head,
            style: const TextStyle(
              fontSize: 18,
              color: GetColor.PrimaryColor,
            ),
          ),
        ),
        subtitle: Text(
          subhead,
        ),
      ),
    );
  }
}
