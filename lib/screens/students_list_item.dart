import 'package:flutter/material.dart';
import '../models/student_list.dart';
///import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class StudentsListItem extends StatelessWidget {
  const StudentsListItem({Key? key, required this.student}) : super(key: key);
  
  final Student student;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${student.firstName} ${student.lastName}',
       style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: const Color(0xFF1A1A1A),
            fontSize: 15,
            fontWeight: FontWeight.w500)
      ),
      trailing: const Icon(Icons.arrow_forward_ios),

    );
  }
}
