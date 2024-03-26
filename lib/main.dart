import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/dashboard/dashboard.dart';
import 'package:little_steps/utils/themes/themes.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' ',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const DashBoard(),
    );
  }
}



