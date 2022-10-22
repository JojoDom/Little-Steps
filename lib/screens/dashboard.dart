import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/home_page.dart';
import 'package:little_steps/screens/login.dart';
import 'package:little_steps/screens/students.dart';
import 'package:little_steps/widgets/bottom_appbar_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashboardController = Get.put(DashboardController());
  List<Widget> pages = [const HomePage(), const Students()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Little Steps Montessori',
            style: TextStyle(color: Colors.black),
          )
          ),
      body: Obx(() => pages[dashboardController.currentIndex.value]),
      floatingActionButton: SizedBox(
        width: 80.0,
        height: 80.0,
        child: RawMaterialButton(
          fillColor: Colors.white,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.red, width: 3.0)),
          elevation: 0.0,
          child: const Icon(
            Icons.power_settings_new_outlined,
            color: Colors.red,
          ),
          onPressed: () {
            Get.offAll(const Login());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarWidget(controller: dashboardController),
    );
  }
}
