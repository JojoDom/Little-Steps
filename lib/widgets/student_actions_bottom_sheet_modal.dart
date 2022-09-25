import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/widgets/student_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StudentActionsModal {
  action({required bool isCheckIn}) {
    showCupertinoModalBottomSheet(
      context: Get.context!,
        enableDrag: false,
        expand: false,
        isDismissible: true,
        topRadius: const Radius.circular(25),
        elevation: 25,
        barrierColor: Colors.black.withOpacity(.8),
        backgroundColor: Colors.white,
         builder: (context) => Container(
           height: MediaQuery.of(context).size.height*0.3,
           width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(
             color: Colors.white
           ),
           child: SingleChildScrollView(

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 isCheckIn? const Material(child: ListTile(leading:Icon(Icons.check_box,color: Colors.red,), title: Text('STUDENT CHECK-IN'),))
                 : const Material(child: ListTile(leading:Icon(Icons.check_box,color: Colors.red,),title: Text('STUDENT CHECK-OUT'),)),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     StudentActions(
                      text: 'Use Forms', 
                     icon: const Icon(Icons.check_box,color: Colors.red,), 
                     onTap:(){} ),
                      StudentActions(
                      text: 'Scan QR', 
                     icon: const Icon(Icons.qr_code, color: Colors.red,), 
                     onTap:(){} ),
                   ],
                 ),
               ],
             ),
           ),
         )
    );
  }
}
