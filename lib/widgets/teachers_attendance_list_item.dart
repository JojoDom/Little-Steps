import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:intl/intl.dart';
import 'package:little_steps/models/checked_in_res.dart';

import '../models/checked_in_teachers_res.dart';

class TeachersAttendanceListItems extends StatelessWidget {
  const TeachersAttendanceListItems({Key? key, required this.attendance, required this.isCheckIn})
      : super(key: key);
  final TeacherAttendanceRes attendance;
  final bool isCheckIn;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePicture(
            name:
                '${attendance.teacher.firstName} ${attendance.teacher.lastName}',
            fontsize: 12,
            radius: 30,
            count: 2,
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(width: 15),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 225, 215, 214),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Name : ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${attendance.teacher.firstName} ${attendance.teacher.lastName}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black, fontSize: 14),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text:  isCheckIn? 'Time In : ' : 'Time Out : ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text:  isCheckIn? DateFormat('hh:mm a')
                              .format(attendance.createdAt) : DateFormat('hh:mm a')
                              .format(attendance.updatedAt),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black, fontSize: 14),
                        )
                      ]),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
