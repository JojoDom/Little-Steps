import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/login.dart';
import 'package:little_steps/widgets/carouselslider.dart';
import 'package:little_steps/widgets/student_actions_bottom_sheet_modal.dart';

import '../widgets/student_actions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Little Steps Montessori',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarouselSliderPage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    StudentActionsModal().action(isCheckIn: true);
                  },
                  text: 'CHECK-IN',
                ),
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () { StudentActionsModal().action(isCheckIn: false);},
                  text: 'CHECK-OUT',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {},
                  text: 'ARRIVED STUDENTS',
                ),
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {},
                  text: 'DEPARTED STUDENTS',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {},
                  text: 'FIND STUDENT',
                ),
                StudentActions(
                  icon: const Icon(
                    Icons.check_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Get.offAll(const Login());
                  },
                  text: 'LOG-OUT',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
