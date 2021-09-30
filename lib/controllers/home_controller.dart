import 'package:automation/views/widgets/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final database = FirebaseDatabase.instance.reference();
  var data;
  late bool fan, bulb, tubeLight, input;
  late Color bulbColor, fanColor, tubeLightColor, inputColor;
  var databaseReference;

  @override
  void onInit() {
    databaseReference = database.child("/automation");
    syncData();
    super.onInit();
  }

  Future<void> syncData() async {
    await databaseReference.once().then((DataSnapshot snapshot) {
      data = snapshot.value;
    });

    bulb = data["Bulb"];
    fan = data["Fan"];
    tubeLight = data["TubeLight"];
    input = data["Input"];

    bulbColor = (bulb) ? Colors.red : Colors.green;
    fanColor = (fan) ? Colors.red : Colors.green;
    tubeLightColor = (tubeLight) ? Colors.red : Colors.green;
    inputColor = (input) ? Colors.red : Colors.green;
    update();
  }

  Future<void> updateData({required String fieldName}) async {
    bool value = false;
    if (fieldName == "Bulb") {
      value = !bulb;
    } else if (fieldName == "Input") {
      value = !input;
    } else if (fieldName == "TubeLight") {
      value = !tubeLight;
    } else if (fieldName == "Fan") {
      value = !fan;
    }
    await databaseReference.update({fieldName: value}).catchError(
        (error) => CustomSnackBar.show("Error", error.toString()));
    await syncData();
    syncData();
  }
}
