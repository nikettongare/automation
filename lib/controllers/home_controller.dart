import 'dart:async';

import 'package:automation/views/widgets/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int fanStatus = 0, bulbStatus = 0, lightStatus = 0, chargerStatus = 0;
  Color bulbColor = Colors.green,
      fanColor = Colors.green,
      lightColor = Colors.green,
      chargerColor = Colors.green;
  var databaseReference;

  @override
  void onInit() {
    databaseReference = FirebaseDatabase.instance.reference();
    syncData();
    super.onInit();
  }

  // void timerLoopFetch() async {
  //   Timer(const Duration(seconds: 60), () {
  //     syncData();
  //   });
  // }

  Future<void> syncData() async {
    var data;
    await databaseReference.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
    });

    CustomSnackBar.show("success", data.toString());

    bulbStatus = data["BULB_STATUS"];
    fanStatus = data["FAN_STATUS"];
    lightStatus = data["LIGHT_STATUS"];
    chargerStatus = data["CHARGER_STATUS"];

    bulbColor = (bulbStatus == 1) ? Colors.red : Colors.green;
    fanColor = (fanStatus == 1) ? Colors.red : Colors.green;
    lightColor = (lightStatus == 1) ? Colors.red : Colors.green;
    chargerColor = (chargerStatus == 1) ? Colors.red : Colors.green;

    update();
  }

  Future<void> updateData({required String fieldName}) async {
    int value = 0;
    if (fieldName == "BULB_STATUS") {
      value = (bulbStatus == 0) ? 1 : 0;
    } else if (fieldName == "CHARGER_STATUS") {
      value = (chargerStatus == 0) ? 1 : 0;
    } else if (fieldName == "LIGHT_STATUS") {
      value = (lightStatus == 0) ? 1 : 0;
    } else if (fieldName == "FAN_STATUS") {
      value = (fanStatus == 0) ? 1 : 0;
    }
    await databaseReference.update({fieldName: value}).catchError(
        (error) => CustomSnackBar.show("Error", error.toString()));
    await syncData();
    syncData();
  }
}
