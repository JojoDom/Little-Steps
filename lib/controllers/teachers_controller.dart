import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/services/students_service.dart';
import 'package:little_steps/services/teachers_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:little_steps/widgets/student_check_in_success.dart';
import 'package:little_steps/widgets/student_checkin_failed.dart';
import 'package:little_steps/widgets/student_checkout_failed.dart';
import 'package:logger/logger.dart';

import '../widgets/student_check_out_success.dart';

class TeachersController extends GetxController {
  var logger = Logger();
  late TeachersService teachersService;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var isCheckInStudent = false.obs;
  @override
  void onInit() {
    teachersService = Get.put(TeachersService.create());
    super.onInit();
  }

  teacherCheckIn({required teacherCode}) async {
    isCheckInStudent(false);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await teachersService.checkIn(accessToken, teacherCode).then((value) {
      if (value.isSuccessful) {
        isCheckInStudent(true);
        studentCheckInSuccess();
      } else {
        studentCheckInFailed();
        Get.snackbar('Error', 'Failed to check in student',
        backgroundColor: Colors.red,
        duration: const Duration(milliseconds:1000 )
        );
        isCheckInStudent(false);
      }
    });
  }

  teacherCheckOut({required teacherCode}) async {
    isCheckInStudent(false);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await teachersService.checkOut(accessToken, teacherCode).then((value) {
      if (value.isSuccessful) {
        isCheckInStudent(true);
        studentCheckOutSuccess();
      } else {
        studentCheckOutFailed();
        Get.snackbar('Error', 'Failed to check in student',
         backgroundColor: Colors.red,
        duration: const Duration(milliseconds:1000 )
        );
        isCheckInStudent(true);
      }
    });
  }
}
