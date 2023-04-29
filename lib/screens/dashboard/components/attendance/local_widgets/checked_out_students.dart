import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/attendance_controller.dart';
import 'package:little_steps/widgets/attendance_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

class CheckedOutStudents extends StatefulWidget {
  const CheckedOutStudents({Key? key}) : super(key: key);

  @override
  State<CheckedOutStudents> createState() => _CheckedOutStudentsState();
}

class _CheckedOutStudentsState extends State<CheckedOutStudents> {
  final attendanceController = Get.put(AttendanceController());
  final RefreshController _refreshList =
      RefreshController(initialRefresh: false);
  final RefreshController refreshList =
      RefreshController(initialRefresh: false);
  

  @override
  void initState() {

   // dateController.text = 'Today';
    super.initState();
  }

  void _onRefresh() async {
    await attendanceController.checkedOutStudents(date: null);
    attendanceController.dateController2.text = 'Today';
    _refreshList.refreshCompleted();
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
                  bottom: 20,
                  right: 30),
              child: TextFormField(
                onTap: (() async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
                  if (pickedDate != null) {
                    attendanceController.checkedOutStudents(
                        date: DateFormat('y-M-d').format(pickedDate));
                   attendanceController.dateController2.text =
                        DateFormat('d MMM, y').format(pickedDate);
                  } else {}
                }),
                controller: attendanceController.dateController2,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: attendanceController.dateController2.text == ''?'Today'
                  :attendanceController.dateController2.text,
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
              attendanceController.studentsGoneHome.isEmpty && attendanceController.isCheckedOutStudents.isFalse
                    ? Expanded(
                        child: SmartRefresher(
                           controller: _refreshList,
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
            attendanceController.isCheckedOutStudents.isFalse
                ? Expanded(
                    child: SmartRefresher(
                      controller: refreshList,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => AttendanceListItems(
                              attendance:
                                  attendanceController.studentsGoneHome[index], isCheckIn: false,),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 0.7,
                              ),
                          itemCount:
                              attendanceController.studentsGoneHome.length),
                    ),
                  )
                    : const LinearProgressIndicator(
                        color: Colors.green,
                      ),
          ],
        ));
  }
}
