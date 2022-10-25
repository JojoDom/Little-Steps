import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/attendance_controller.dart';
import 'package:little_steps/screens/attendance_list_item.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final attendanceController = Get.put(AttendanceController());

  @override
  void initState() {
   // attendanceController.checkedInStudents(date: null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>  attendanceController.isCheckedInStudents.isFalse?
      Column(
        children: [
         
               Obx(() => 
                 Expanded(
                    child: Card(
                      elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                      child: ListView.separated(
                         physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemBuilder: (context, index) => AttendanceListItem(
                              attendance:
                                  attendanceController.presentStudents[index]),
                          separatorBuilder: (context, index) => const Divider(
                                height: 0.7,
                                color: Color(0xFF999999),
                              ),
                          itemCount: attendanceController.presentStudents.length),
                    ),
                  ),
              )
             
        ],
      ) : const LinearProgressIndicator(
                  color: Colors.green,
                ),
    );
  }
}
