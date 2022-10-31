import 'package:flutter/material.dart';
import 'package:little_steps/models/checked_in_res.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class AttendanceListItem extends StatelessWidget {
  const AttendanceListItem({Key? key, required this.attendance})
      : super(key: key);
  final AttendanceRes attendance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {},
        leading: ProfilePicture(
          name:
              '${attendance.student.firstName} ${attendance.student.lastName}',
          fontsize: 12,
          radius: 20,
          count: 2,
        ),
        title: Text(
            '${attendance.student.firstName}  ${attendance.student.lastName}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color:  Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
                subtitle: Text('${attendance.updatedAt}'),
        trailing: Text(attendance.checkinAt)
        );
  }
}
