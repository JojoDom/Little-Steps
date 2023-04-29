import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/screens/dashboard/components/home/local_widgets/scan_student_qr_code.dart';
import 'package:little_steps/screens/dashboard/components/home/local_widgets/students_list_item.dart';
import 'package:little_steps/widgets/student_actions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final studentController = Get.put(StudentsController());
  final TextEditingController searchController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
  }

  bool _isVisible = true;

  void switchIcon() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _onRefresh() async {
    await studentController.getStudent(studentCode: null);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Little Steps',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Obx(
        () => Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StudentActions(
                      icon: const Icon(
                        Icons.login_rounded,
                        size: 30,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Get.to(const ScanStudentQrCode(
                          isCheckIn: true,
                        ));
                      },
                      text: 'Check In',
                    ),
                    StudentActions(
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 30,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Get.to(const ScanStudentQrCode(
                          isCheckIn: false,
                        ));
                      },
                      text: 'Check Out',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: searchController,
                  decoration: InputDecoration(
                    suffixIcon: Visibility(
                      visible: _isVisible,
                      replacement: IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              _isVisible = true;
                            });
                            studentController.getStudent(studentCode: null);
                          },
                          icon: const Icon(Icons.close)),
                      child: IconButton(
                          onPressed: () async {
                            switchIcon();
                            await studentController.getStudent(
                                studentCode: searchController.value.text);
                          },
                          icon: const Icon(Icons.search)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Color(0xFFE7979C),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        )),
                    hintText: 'Enter Student code',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
          studentController.isLoadingStudents.isFalse
              ? Obx(
                  () => Expanded(
                    child: SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => StudentsListItem(
                              student: studentController.students[index]),
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Divider(
                                  height: 0.7,
                                  color: Color(0xFF999999),
                                ),
                          ),
                          itemCount: studentController.students.length),
                    ),
                  ),
                )
              : const Center(
                  child: LinearProgressIndicator(
                    color: Colors.green,
                  ),
                )
        ]),
      ),
    );
  }
}
