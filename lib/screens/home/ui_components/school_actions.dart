import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/attendance/attendance.dart';
import 'package:little_steps/screens/home/ui_components/scan_student_qr_code.dart';
import 'package:little_steps/screens/home/model/school_actions_modal.dart';
import 'package:little_steps/screens/students/all_students.dart';
import 'package:little_steps/screens/teachers/local_widgets/all_teachers.dart';
import 'package:little_steps/screens/teachers/teachers.dart';

import 'scan_teacher_qr_code.dart';

class SchoolActions extends StatelessWidget {
  const SchoolActions({
    super.key,
    required this.schoolActions,
  });

  final SchoolActionsModal schoolActions;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (schoolActions.tag) {
          case 'checkInStudent':
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScanStudentQrCode(isCheckIn: true))));
            break;
          case 'checkOutStudent':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScanStudentQrCode(isCheckIn: false))));
            break;
          case 'checkInTeacher':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScanTeacherQrCode(isCheckIn: true))));
            break;
          case 'checkOutTeacher':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const ScanTeacherQrCode(isCheckIn: false))));
            break;
          case 'studentAttendance':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const Attendance())));
            break;
          case 'teachersAttendance':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const Teachers())));
            break;
          case 'allStudents':
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const AllStudents())));
            break;
          case 'allTeachers':
            Get.to(const AllTeachers());
             Navigator.push(context, MaterialPageRoute(builder: ((context) => const AllTeachers())));
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
                height: 50,
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