import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/dashboard/dashboard.dart';
import 'package:little_steps/widgets/custom_button.dart';

studentCheckOutFailed() {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    barrierDismissible: false,
    content: SizedBox(
      height: 220,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svgs/delete_account.svg',
            height: 50,
            color: Colors.red,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Student Check-Out failed",
            style: Theme.of(Get.context!)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 45),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
                buttonText: "Try again",
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
