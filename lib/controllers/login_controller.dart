import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/models/authenticate_user.dart';
import 'package:little_steps/screens/dashboard/dashboard.dart';
import 'package:little_steps/services/auth_service.dart';
import 'package:little_steps/utils/storage_keys.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/connectivity_service.dart';

class LoginController extends GetxController {
  late AuthService authService;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoggedIn = false.obs;
  var logger = Logger();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  @override
  void onInit() {
    authService = Get.put(AuthService.create());
    super.onInit();
  }

  login({required String userName, required String password}) async {
    bool isConnected = await ConnectivityService().checkInternetConnection();
    if (!isConnected) {
      Get.snackbar('No connnectivity', 'Check internet and connect');
    }
    isLoggedIn(true);
    Map<String, dynamic> body = {"username": userName, "password": password};
    await authService.login(body).then((value) {
      if (value.isSuccessful) {
        isLoggedIn(false);
        try {
          final loginRes = AuthenticateUser.fromJson(value.body);
          var accessToken = loginRes.accessToken;
         Get.offAll(const DashBoard());
          secureStorage.write(
              key: StorageKeys.ACCESS_TOKEN, value: accessToken);
          secureStorage.write(key: StorageKeys.IS_LOGGED_IN, value: 'True');
        } catch (error, stackTrace) {
          logger.e(error);
          logger.e(stackTrace);
          isLoggedIn(false);
        }
      } else {
        Get.snackbar('', 'Login Failed',
        colorText: Colors.white,
        backgroundColor: Colors.red);
        isLoggedIn(false);
      }
    });
  }
}
