import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/models/checked_in_res.dart';
import 'package:little_steps/services/attendance_service.dart';
import 'package:little_steps/utils/connectivity_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:logger/logger.dart';

class AttendanceController extends GetxController {
  var logger = Logger();
  late AttendanceService attendanceService;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var isCheckedInStudents = false.obs;
  var presentStudents = [].obs;
  var arrived = <StudentData>[].obs;

  @override
  void onInit() async {
    attendanceService = Get.put(AttendanceService.create());
    await checkedInStudents(date: null);
    checkedInStudents(date: null);
    super.onInit();
  }

  checkedInStudents({required String? date}) async {
     bool isConnected = await ConnectivityService().checkInternetConnection();
    if (!isConnected) {
      Get.snackbar('No connnectivity', 'Check internet and connect');
    }
     isCheckedInStudents(true);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await attendanceService.getCheckedIn(accessToken, date: date).then((value) {
      if (value.isSuccessful) {
        try {
          final checkedInStudentRes = CheckedInStudents.fromJson(value.body);
          presentStudents.value = checkedInStudentRes.attendance;
          isCheckedInStudents(false);
        } catch (error, stackTrace) {
          logger.i(error);
          logger.e(stackTrace);
        }
      } else {
        isCheckedInStudents(false);
        Get.snackbar('Error', 'Failed to check in student',
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000));
      }
    });
  }
}
