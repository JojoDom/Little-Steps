import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/services/students_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:little_steps/widgets/student_check_in_success.dart';
import 'package:logger/logger.dart';

class CheckInStudentController extends GetxController {
  var logger = Logger();
  late StudentsService studentsService;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var isCheckInStudent = false.obs;
  @override
  void onInit() {
    studentsService = Get.put(StudentsService.create());
    super.onInit();
  }

  studentCheckIn({required studentCode}) async {
    isCheckInStudent(false);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await studentsService.checkIn(accessToken, studentCode).then((value) {
      if (value.isSuccessful) {
        isCheckInStudent(true);
        studentCheckInSuccess();
      } else {
        Get.snackbar('Error', 'Failed to check in student');
      }
    });
  }
  studentCheckOut({required studentCode}) async {
    isCheckInStudent(false);
    var accessToken =
        await secureStorage.read(key: StorageKeys.ACCESS_TOKEN) ?? '';
    await studentsService.checkOut(accessToken, studentCode).then((value) {
      if (value.isSuccessful) {
        isCheckInStudent(true);
        studentCheckInSuccess();
      } else {
        Get.snackbar('Error', 'Failed to check in student');
      }
    });
  }
}
