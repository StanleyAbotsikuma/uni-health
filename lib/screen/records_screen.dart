import 'package:dio/dio.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:uni_health/utils/diagnosis_model.dart';

import '../configs/colors.dart';
import '../utils/utils.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<DiagnosisModel> diagnosisList = [];

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
        title: const Text("Medical Records"),
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
                    child: Expanded(
                        child: ListView.builder(
                      itemCount: diagnosisList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ExpansionTileCard(
                            //  key: "cardA",
                            leading: const CircleAvatar(
                                child: Icon(Icons.file_copy)),
                            title: Text(diagnosisList[index].diagnosesId),
                            subtitle:
                                Text(diagnosisList[index].date.toString()),
                            children: <Widget>[
                              const Divider(
                                thickness: 1.0,
                                height: 1.0,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceAround,
                                buttonHeight: 52.0,
                                buttonMinWidth: 90.0,
                                children: <Widget>[
                                  TextButton(
                                    style: flatButtonStyle,
                                    onPressed: () {
                                      //        cardB.currentState?.expand();
                                    },
                                    child: Column(
                                      children: const <Widget>[
                                        Icon(Icons.phone),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Text('Contact'),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: flatButtonStyle,
                                    onPressed: () {
                                      //        cardB.currentState?.toggleExpansion();
                                    },
                                    child: Column(
                                      children: const <Widget>[
                                        Icon(Icons.share),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                        ),
                                        Text('Share'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
  void load() async {
    Map data = {
      "token": Constants.token,
      "password": Constants.password,
      "type": Constants.diagnoses,
      "userId": "patients_id"
    };
    Response response;
    var dio = Dio();
    // print(data);
    response = await dio.post(Constants.url, data: data);

    //print(response.data);

    final payload = response.data;
    // /print(payload["message"]);
    if (payload["message"] == "success") {
      for (var item in payload["data"]) {
        diagnosisList.add(DiagnosisModel(
            id: item["id"],
            diagnosesId: item["diagnoses_id"],
            patientsId: item["patients_id"],
            diagnoses: item["diagnoses"],
            doctorsId: item["doctors_id"],
            additionalInformation: item["additional_information"],
            doctorName: item["doctor_name"],
            date: DateTime.parse((item["date"]))));
      }
    }
  }
}
