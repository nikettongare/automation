import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static show(String title, String msg) {
    return Get.snackbar(title, msg,
        margin: EdgeInsets.zero,
        colorText: Colors.white,
        backgroundColor: Colors.black,
        borderRadius: 0,
        snackPosition: SnackPosition.BOTTOM);
  }
}
