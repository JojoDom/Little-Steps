import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeMenuItemsOnTapEvent>(homeMenuItemsOnTapEvent);
  }

  FutureOr<void> homeMenuItemsOnTapEvent(
      HomeMenuItemsOnTapEvent event, Emitter<HomeState> emit) {
    Logger().i(event.tag);
    // switch (event.tag) {
    //       case 'checkInStudent':
    //         Get.to(const ScanStudentQrCode(isCheckIn: true));
    //         break;
    //       case 'checkOutStudent':
    //         Get.to(const ScanStudentQrCode(isCheckIn: false));
    //         break;
    //       case 'checkInTeacher':
    //         Get.to(const ScanTeacherQrCode(isCheckIn: true));
    //         break;
    //       case 'checkOutTeacher':
    //         Get.to(const ScanTeacherQrCode(isCheckIn: false));
    //         break;
    //       case 'studentAttendance':
    //         Get.to(const Attendance());
    //         break;
    //       case 'teachersAttendance':
    //         Get.to(const Teachers());
    //         break;
    //       case 'allStudents':
    //         Get.to(const AllStudents());
    //         break;
    //       case 'allTeachers':
    //         Get.to(const AllTeachers());
    //     }
  }
}
