import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/attendance_controller.dart';
import 'package:little_steps/screens/dashboard/components/attendance/local_widgets/student_attendance.dart';
import 'package:little_steps/screens/dashboard/components/attendance/local_widgets/teachers_attendance.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> with TickerProviderStateMixin {
  final attendanceController = Get.put(AttendanceController());
  var currentTab = 0;

  @override
  void initState() {
    attendanceController.tabController = TabController(length: 2, vsync: this);
    attendanceController.tabController.addListener(() {
       setState(() {
        currentTab = attendanceController.tabController.index;
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              ' Student Attendance',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 18),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                controller: attendanceController.tabController,
                tabs: [
                 Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: currentTab == 0 
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Checked In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: currentTab == 0 
                                           
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          color: currentTab == 1 
                              ? Theme.of(context).primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Checked Out',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: currentTab == 1
                                           
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 15),
                          ),
                        ),
                      ),
              ]),
            ),
          ),
          body: TabBarView(
            controller: attendanceController.tabController,
            children: const [
              StudentAttendance(),
              TeachersAttendance()
            ]),
        )
        );
  }
}
