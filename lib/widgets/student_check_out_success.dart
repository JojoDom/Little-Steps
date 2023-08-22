import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:little_steps/widgets/custom_button.dart';

import '../screens/home/home.dart';

studentCheckOutSuccess(String message) {
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
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            message,
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
                buttonColor: Colors.green,
                textColor: Colors.white,
                onTap: () {
                  Get.offAll( const Home());
                },
                isBusy: false),
          )
        ],
      ),
    ),
    title: "",
  );
}
