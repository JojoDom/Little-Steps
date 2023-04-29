import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/home/home.dart';
import 'package:little_steps/utils/themes/themes.dart';
import 'package:logging/logging.dart';

void main() {
  _setupLogging();
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name} : ${rec.time}:${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' ',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const Home(),
    );
  }
}



