import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/models/checked_in_res.dart';
import 'package:little_steps/services/attendance_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:logger/logger.dart';

class AttendanceController extends GetxController {
  var logger = Logger();
  late AttendanceService attendanceService;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var isCheckedInStudents = false.obs;
  var presentStudents = <Attendance>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  checkedInStudents({required String date}) async {
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await attendanceService.getCheckedIn(accessToken, date: date).then((value) {
      if (value.isSuccessful) {
        try {
          isCheckedInStudents(false);
          var checkedInStudentRes = CheckedInStudents.fromJson(value.body);
          presentStudents.value = checkedInStudentRes.attendance;
        } catch (error, stackTrace) {}
      } else {
        isCheckedInStudents(false);
        Get.snackbar('Error', 'Failed to check in student',
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000));
      }
    });
  }
}
