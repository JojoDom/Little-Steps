import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/home/local_widgets/teacher_details.dart';

import '../../../controllers/students_controller.dart';
import '../../../models/teachers_list.dart';

class TeachersListItem extends StatelessWidget {
  const TeachersListItem({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        onTap: () => Get.to(TeachersDetails(teacher: teacher), 
        transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800)),
        leading: Hero(
          tag: teacher.id,
          child: ProfilePicture(
            name: '${teacher.firstName} ${teacher.lastName}',
            fontsize: 12,
            radius: 20,
            count: 2,
          ),
        ),
        title: Text('${teacher.firstName} ${teacher.lastName}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF1A1A1A),
                fontSize: 15,
                fontWeight: FontWeight.w500)),
  
      ),
    );
  }
}