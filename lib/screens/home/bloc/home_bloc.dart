import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/students/all_students.dart';
import 'package:little_steps/screens/teachers/local_widgets/all_teachers.dart';
import 'package:little_steps/screens/teachers/teachers.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../attendance/attendance.dart';
import '../local_widgets/scan_student_qr_code.dart';
import '../local_widgets/scan_teacher_qr_code.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeMenuItemsOnTapEvent>(homeMenuItemsOnTapEvent);
  }

  FutureOr<void> homeMenuItemsOnTapEvent(
      HomeMenuItemsOnTapEvent event, Emitter<HomeState> emit) {
    Logger().i(event.tag);
    switch (event.tag) {
          case 'checkInStudent':
            Get.to(const ScanStudentQrCode(isCheckIn: true));
            break;
          case 'checkOutStudent':
            Get.to(const ScanStudentQrCode(isCheckIn: false));
            break;
          case 'checkInTeacher':
            Get.to(const ScanTeacherQrCode(isCheckIn: true));
            break;
          case 'checkOutTeacher':
            Get.to(const ScanTeacherQrCode(isCheckIn: false));
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
          case 'allTeachers':
            Get.to(const AllTeachers());
        }
  }
}
