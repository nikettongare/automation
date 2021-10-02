import 'package:flutter/material.dart';

class Config {
  static const String appName = "Home Automation";

  static const String button1Name = "BULB";
  static const String button2Name = "LIGHT";
  static const String button3Name = "FAN";
  static const String button4Name = "CHARGER";

  static const String button1FirebaseFieldName = "BULB_STATUS";
  static const String button2FirebaseFieldName = "LIGHT_STATUS";
  static const String button3FirebaseFieldName = "FAN_STATUS";
  static const String button4FirebaseFieldName = "CHARGER_STATUS";

  static const Color onColor = Colors.red;
  static const Color offColor = Colors.green;
}
