import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:little_steps/models/authenticate_user.dart';
import 'package:little_steps/screens/dashboard.dart';
import 'package:little_steps/services/auth_service.dart';
import 'package:little_steps/services/students_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/student_list.dart';
import '../utils/connectivity_service.dart';

class StudentsController extends GetxController {
  late StudentsService studentsService;
  var students = <Students>[].obs;
  var isLoadingStudents = false.obs;
  var logger = Logger();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  @override
  void onInit() {
    studentsService = Get.put(StudentsService.create());
    super.onInit();
  }

  getStudent(String studentCode) async {
    bool isConnected = await ConnectivityService().checkInternetConnection();
    if (!isConnected) {
      Get.snackbar('No connnectivity', 'Check internet and connect');
    }
    isLoadingStudents(true);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await studentsService.getStudent(accessToken, studentCode).then((value) {
      if (value.isSuccessful) {
        isLoadingStudents(false);
        try {
          final studentRes = Students.fromJson(value.body);
          //students = studentRes.
         
          secureStorage.write(
              key: StorageKeys.ACCESS_TOKEN, value: accessToken);
          secureStorage.write(key: StorageKeys.IS_LOGGED_IN, value: 'True');
        } catch (error, stackTrace) {
          logger.e(error);
          logger.e(stackTrace);
          isLoadingStudents(false);
        }
      } else {
        Get.snackbar('', 'Login Failed');
        isLoadingStudents(false);
      }
    });
  }
}
