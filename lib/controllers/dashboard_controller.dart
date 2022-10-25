import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  onChangedAppBar(int index) {
    currentIndex.value = index;
    update();
  }
}