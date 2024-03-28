import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:little_steps/utils/themes/themes.dart';

import 'screens/home/home.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child:  MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: const Home(),
    );
  }
}



