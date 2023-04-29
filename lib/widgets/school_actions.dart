import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/attendance/attendance.dart';
import 'package:little_steps/screens/home/local_widgets/scan_student_qr_code.dart';
import 'package:little_steps/screens/home/model/school_actions_modal.dart';
import 'package:little_steps/screens/students/all_students.dart';
import 'package:little_steps/screens/teachers/teachers.dart';

class SchoolActions extends StatelessWidget {
  const SchoolActions({
    Key? key,
    required this.schoolActions,
  }) : super(key: key);

  final SchoolActionsModal schoolActions;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (schoolActions.tag) {
          case 'checkInStudent':
            Get.to(const ScanStudentQrCode(isCheckIn: true));
            break;
          case 'checkOutStudent':
            Get.to(const ScanStudentQrCode(isCheckIn: false));
            break;
          case 'studentAttendance':
            Get.to(const Attendance());
            break;
          case 'teachersAttendance':
            Get.to(const Teachers());
            break;
          case 'allStudents':
            Get.to(const AllStudents());
            break;
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Flexible(child: SvgPicture.asset(schoolActions.image)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 30,
                child: Text(
                  schoolActions.action,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
