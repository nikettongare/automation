import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static void show() {
    Get.dialog(
      const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
