// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:little_steps/controllers/students_controller.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// import '../models/student_list.dart';

// class StudentDetailsBottomSheet {
//   final studentsController = Get.put(StudentsController());
//   studentDetails({required Student student}) {
//     showCupertinoModalBottomSheet(
//         context: Get.context!,
//         enableDrag: false,
//         expand: false,
//         isDismissible: true,
//         topRadius: const Radius.circular(25),
//         elevation: 25,
//         barrierColor: Colors.black.withOpacity(.7),
//         backgroundColor: Colors.white,
//         builder: (context) => SingleChildScrollView(
//               child: Material(
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   padding: const EdgeInsets.only(bottom: 25, top: 20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Student Name',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                   fontSize: 12, fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       StudentsDetailsField(
//                           textController: studentsController.surnameController),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'First Name',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                   fontSize: 12, fontWeight: FontWeight.w400),
//                         ),
//                       ),
//                       StudentsDetailsField(
//                           textController: studentsController.firstNameController),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Text(
//                       //     'Other names',
//                       //     style: Theme.of(context)
//                       //         .textTheme
//                       //         .bodySmall!
//                       //         .copyWith(
//                       //             fontSize: 12, fontWeight: FontWeight.w400),
//                       //   ),
//                       // ),
//                       // StudentsDetailsField(
//                       //     textController: studentsController.otherNamesController),
//                        Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Student Code',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(
//                                   fontSize: 12, fontWeight: FontWeight.w400),
//                         ),
//                       ),   
//                       StudentsDetailsField(
//                           textController:
//                               studentsController.studentCodeController)
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//   }
// }

// class StudentsDetailsField extends StatelessWidget {
//   const StudentsDetailsField({Key? key, required this.textController})
//       : super(key: key);

//   final TextEditingController textController;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onTap: () {},
//       readOnly: true,
//       enabled: false,
//       controller: textController,
//       decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20),
//           // hintText: textController.text.toString(),
//           hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
//               fontSize: 14,
//               fontWeight: FontWeight.w700,
//               color: const Color(0xFF3A3A3A)),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(1))),
//     );
//   }
// }
