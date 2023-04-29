import 'package:flutter/material.dart';

class SchoolActionsModal {
  final String action;
  final String image;
  final String tag;

  SchoolActionsModal( {required this.tag,required this.action, required this.image});
}

List<SchoolActionsModal> actionsList = [
  SchoolActionsModal(action: 'Check-in Student', image: 'assets/svgs/qr-code.svg', tag: Tag.checkInStudent.name ),
  SchoolActionsModal(action: 'Check-out Student', image: 'assets/svgs/qr-code.svg', tag: Tag.checkOutStudent.name),
  SchoolActionsModal(action: 'Check-in Teacher', image: 'assets/svgs/qr-code.svg', tag: Tag.checkInTeacher.name),
  SchoolActionsModal(action: 'Check-out Teacher', image: 'assets/svgs/qr-code.svg', tag: Tag.checkOutTeacher.name),
  SchoolActionsModal(action: 'Student Attendance', image: 'assets/svgs/attendance.svg', tag: Tag.studentAttendance.name),
  SchoolActionsModal(action: 'Teachers Attendance', image: 'assets/svgs/attendance.svg', tag: Tag.teachersAttendance.name),
  SchoolActionsModal(action: 'All Students', image: 'assets/svgs/students.svg', tag: Tag.allStudents.name),
  SchoolActionsModal(action: 'All Teachers', image: 'assets/svgs/teachers.svg', tag: Tag.allTeachers.name)
];


enum Tag{checkInStudent, checkOutStudent, checkInTeacher, checkOutTeacher, studentAttendance, teachersAttendance, allStudents, allTeachers }