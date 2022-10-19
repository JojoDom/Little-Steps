import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/scan_student_qr_code.dart';
import '../widgets/student_actions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,      
        centerTitle: true,
      ),
      body: ListView(
        children: [          
          Stack(
            children: [            
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox( height: MediaQuery.of(context).size.height*0.35,),
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
                       Get.to(const ScanStudentQrCode(isCheckIn: true,));
                     },
                     text: 'CHECK-IN',
                   ),
                   StudentActions(
                     icon: const Icon(
                      Icons.logout_rounded,
                       size: 30,
                       color: Colors.red,
                     ),
                     onTap: () {
                       Get.to(const ScanStudentQrCode(isCheckIn: false,)); 
                     },
                     text: 'CHECK-OUT',
                   ),
                 ],
            ),
                            
              ],
            ),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             child: Image.asset('assets/images/montessori.png',)), ]),
        ]));
  }
}
