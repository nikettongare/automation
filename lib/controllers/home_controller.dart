import 'dart:async';
import 'package:automation/config/config.dart';
import 'package:automation/views/widgets/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int button1status = 0,
      button2status = 0,
      button3status = 0,
      button4status = 0;
  Color button1Color = Config.offColor,
      button2Color = Config.offColor,
      button3Color = Config.offColor,
      button4Color = Config.offColor;
  var databaseReference;

  @override
  void onInit() {
    databaseReference = FirebaseDatabase.instance.reference();
    syncData();
    super.onInit();
  }

  Future<void> syncData() async {
    var data;
    await databaseReference.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
    });

    CustomSnackBar.show("success", data.toString());

    button1status = data[Config.button1FirebaseFieldName];
    button2status = data[Config.button2FirebaseFieldName];
    button3status = data[Config.button3FirebaseFieldName];
    button4status = data[Config.button4FirebaseFieldName];

    button1Color = (button1status == 1) ? Config.onColor : Config.offColor;
    button2Color = (button2status == 1) ? Config.onColor : Config.offColor;
    button3Color = (button3status == 1) ? Config.onColor : Config.offColor;
    button4Color = (button4status == 1) ? Config.onColor : Config.offColor;

    update();
  }

  Future<void> updateData({required String fieldName}) async {
    int value = 0;
    if (fieldName == Config.button1FirebaseFieldName) {
      value = (button1status == 0) ? 1 : 0;
    } else if (fieldName == Config.button2FirebaseFieldName) {
      value = (button2status == 0) ? 1 : 0;
    } else if (fieldName == Config.button3FirebaseFieldName) {
      value = (button3status == 0) ? 1 : 0;
    } else if (fieldName == Config.button4FirebaseFieldName) {
      value = (button4status == 0) ? 1 : 0;
    }
    await databaseReference.update({fieldName: value}).catchError(
        (error) => CustomSnackBar.show("Error", error.toString()));
    await syncData();
    syncData();
  }
}
