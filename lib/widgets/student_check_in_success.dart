import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/dashboard.dart';
import 'package:little_steps/screens/students.dart';
import 'package:little_steps/widgets/custom_button.dart';

studentCheckInSuccess() {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    barrierDismissible: false,
    content: SizedBox(
      height: 220,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svgs/success_check.svg',
            height: 50,
            color: Colors.green,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Student Check In Successful',
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 45),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
                buttonText: "Okay",
                textColor: Colors.white,
                buttonColor: Colors.green,
                onTap: () {
                  Get.offAll(const DashBoard());
                },
                isBusy: false),
          )
        ],
      ),
    ),
    title: "",
  );
}
