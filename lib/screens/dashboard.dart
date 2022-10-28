import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/attendance.dart';
import 'package:little_steps/screens/students.dart';
import 'package:little_steps/screens/login.dart';
import 'package:little_steps/screens/teachers.dart';
import 'package:little_steps/widgets/bottom_appbar_widget.dart';

import '../controllers/dashboard_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashboardController = Get.put(DashboardController());
  List<Widget> pages = [const Students(),  const Attendance(), const Teachers()];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
        bottomNavigationBar: BottomAppBarWidget(controller: dashboardController),
      ),
    );
  }
}
