import 'package:flutter/material.dart';
import 'package:get/get.dart';

studentCheckInSuccess() {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    barrierDismissible: false,
    content: SizedBox(
      height: 100,
      child: Text('student sign in was successful'),
    )

  );
}
