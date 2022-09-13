import 'package:flutter/material.dart';
import 'package:little_steps/screens/login.dart';
import 'package:little_steps/utils/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const Login(),
    );
  }
}



