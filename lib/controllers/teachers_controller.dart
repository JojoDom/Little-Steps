import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/models/student_list.dart';
import 'package:little_steps/services/students_service.dart';
import 'package:little_steps/services/teachers_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:little_steps/widgets/student_check_in_success.dart';
import 'package:little_steps/widgets/student_checkin_failed.dart';
import 'package:little_steps/widgets/student_checkout_failed.dart';
import 'package:logger/logger.dart';

import '../models/teachers_list.dart';
import '../utils/connectivity_service.dart';
import '../widgets/student_check_out_success.dart';

class TeachersController extends GetxController {
  var logger = Logger();
  late TeachersService teachersService;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var isCheckInStudent = false.obs;
  var isLoadingTeachers = false.obs;
  var teachers = [].obs;
  @override
  void onInit() {
    teachersService = Get.put(TeachersService.create());
    getTeachers(teacherCode: null);
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
        isCheckInStudent(false);
        Get.snackbar('Error', 'Failed to check in teacher',
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000));
        
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
        isCheckInStudent(true);
        Get.snackbar('Error', 'Failed to check in student',
            backgroundColor: Colors.red,
            duration: const Duration(milliseconds: 1000));
        
      }
    });
  }

  getTeachers({required String? teacherCode}) async {
    bool isConnected = await ConnectivityService().checkInternetConnection();
    if (!isConnected) {
      Get.snackbar('No connnectivity', 'Check internet and connect');
    }
    isLoadingTeachers(true);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await teachersService
        .getTeachers(accessToken, student_code: teacherCode)
        .then((value) {
      if (value.isSuccessful) {
        isLoadingTeachers(false);
        try {
          final teachersRes = Teachers.fromJson(value.body);
          teachers.value = teachersRes.teachers;
        } catch (error, stackTrace) {
          logger.e(error);
          logger.e(stackTrace);
          isLoadingTeachers(false);
        }
      } else {
        Get.snackbar('', 'Failed to load student(s)',
            backgroundColor: Colors.red, colorText: Colors.white);
        isLoadingTeachers(false);
      }
    });
  }
}
