import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/attendance/attendance.dart';
import 'package:little_steps/screens/home/bloc/home_bloc.dart';
import 'package:little_steps/screens/home/local_widgets/scan_student_qr_code.dart';
import 'package:little_steps/screens/home/model/school_actions_modal.dart';
import 'package:little_steps/screens/students/all_students.dart';
import 'package:little_steps/screens/teachers/local_widgets/all_teachers.dart';
import 'package:little_steps/screens/teachers/teachers.dart';

import '../screens/home/local_widgets/scan_teacher_qr_code.dart';

class SchoolActions extends StatelessWidget {
  const SchoolActions({
    Key? key,
    required this.schoolActions,
  }) : super(key: key);

  final SchoolActionsModal schoolActions;
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocListener<HomeBloc, HomeState>(
       bloc: homeBloc,
      listener: (context, state) {},
      child: GestureDetector(
        onTap: () {
          homeBloc.add(HomeMenuItemsOnTapEvent(schoolActions.tag));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
      ),
    );
  }
}
