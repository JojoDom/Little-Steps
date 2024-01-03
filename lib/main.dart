import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:little_steps/screens/home/bloc/home_bloc.dart';
import 'package:little_steps/screens/home/home.dart';
import 'package:little_steps/utils/themes/themes.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Steps',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: const Home(),),
    );
  }
}



