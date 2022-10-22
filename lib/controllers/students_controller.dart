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
  var students = <Student>[].obs;
  var isLoadingStudents = false.obs;
  var logger = Logger();
  final surnameController = TextEditingController();
  final firstNameController = TextEditingController();
  final otherNamesController = TextEditingController();
  final idController = TextEditingController();
  final studentCodeController = TextEditingController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  @override
  void onInit() async {
    studentsService = Get.put(StudentsService.create());
    await getStudent(studentCode: null);
    super.onInit();
  }

  getStudent({required String? studentCode}) async {
    bool isConnected = await ConnectivityService().checkInternetConnection();
    if (!isConnected) {
      Get.snackbar('No connnectivity', 'Check internet and connect');
    }
    
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await studentsService
        .getStudent(accessToken, student_code: studentCode)
        .then((value) {
      if (value.isSuccessful) {
        isLoadingStudents.value = false;
        try {
          final studentRes = Students.fromJson(value.body);
          students.value = studentRes.students;
          
        } catch (error, stackTrace) {
          logger.e(error);
          logger.e(stackTrace);
          isLoadingStudents.value = false;
        }
      } else {
        Get.snackbar('', 'Failed to load students');
        isLoadingStudents.value = false;
      }
    });
  }
}
