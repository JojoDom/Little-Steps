import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/screens/scan_student_qr_code.dart';
import 'package:little_steps/screens/students_list_item.dart';
import '../widgets/student_actions.dart';

class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  final studentController = Get.put(StudentsController());
  final TextEditingController searchController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Obx(
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
                    text: 'CHECK IN',
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
                    text: 'CHECK OUT',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => StudentsListItem(
                          student: studentController.students[index]),
                      separatorBuilder: (context, index) => const Divider(
                            height: 0.7,
                            color: Color(0xFF999999),
                          ),
                      itemCount: studentController.students.length),
                ),
              )
            : const Center(
                child: LinearProgressIndicator(
                  color: Colors.green,
                ),
              )
      ]),
    );
  }
}
