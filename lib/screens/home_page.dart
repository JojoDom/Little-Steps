import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/screens/scan_student_qr_code.dart';
import 'package:little_steps/screens/students_list_item.dart';
import '../widgets/student_actions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final studentController = Get.put(StudentsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Row(
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
         studentController.isLoadingStudents.isFalse?        
      Obx(() => 
         Expanded(
          child: 
          Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
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
        ),
      ) :  const Center(
          child: LinearProgressIndicator(color: Colors.green,),
        )
    ]
    );
  }
}
