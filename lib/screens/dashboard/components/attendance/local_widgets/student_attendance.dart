import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/attendance_controller.dart';
import 'package:little_steps/screens/dashboard/components/attendance/local_widgets/attendance_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  final attendanceController = Get.put(AttendanceController());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = 'Today';
    super.initState();
  }

  void _onRefresh() async {
    await attendanceController.checkedInStudents(date: null);
    dateController.text = 'Today';
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.4,
                  top: 20,
                  right: 30),
              child: TextFormField(
                onTap: (() async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    attendanceController.checkedInStudents(
                        date: DateFormat('y-M-d').format(pickedDate));
                    dateController.text =
                        DateFormat('d MMM, y').format(pickedDate);
                  } else {}
                }),
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select date ',
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: Theme.of(context).primaryColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(0xFFE7979C),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      )),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
              attendanceController.presentStudents.isEmpty
                    ? Expanded(
                        child: SmartRefresher(
                           controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
                          child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            Center(
                                child:
                                    Image.asset('assets/images/no_result.png')),
                            Center(
                              child: Text(
                                'No student found',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 14),
                              ),
                            )
                          ],
                                              ),
                        )):
            attendanceController.isCheckedInStudents.isFalse
                ? Expanded(
                    child: SmartRefresher(
                      controller: refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
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
                          itemCount:
                              attendanceController.presentStudents.length),
                    ),
                  )
                    : const LinearProgressIndicator(
                        color: Colors.green,
                      ),
          ],
        ));
  }
}
