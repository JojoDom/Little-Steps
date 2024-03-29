import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/models/student_list.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:little_steps/models/teachers_list.dart';
import 'package:little_steps/widgets/student_actions_bottomsheet.dart';

class StudentsListItem extends StatelessWidget {
  const StudentsListItem({Key? key, required this.student}) : super(key: key);
  final Student student;

  @override
  Widget build(BuildContext context) {
    final studentsController = Get.put(StudentsController());
    return Container(
      decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        onTap: () {
          studentsController.surnameController.text = student.lastName;
          studentsController.firstNameController.text = student.firstName;
          studentsController.idController.text = student.id.toString();
          studentsController.studentCodeController.text = student.studentCode??'';
          // StudentDetailsBottomSheet().studentDetails(student: student);
        },
        leading: ProfilePicture(
          name: '${student.firstName} ${student.lastName}',
          fontsize: 12,
          radius: 20,
          count: 2,
        ),
        title: Text('${student.firstName} ${student.lastName}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: const Color(0xFF1A1A1A),
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        // trailing: const Icon(
        //   Icons.arrow_forward_ios,
        //   size: 15,
        // ),
      ),
    );
  }
}



