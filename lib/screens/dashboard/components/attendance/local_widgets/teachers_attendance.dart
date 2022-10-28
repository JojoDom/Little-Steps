import 'package:flutter/material.dart';

class TeachersAttendance extends StatefulWidget {
  const TeachersAttendance({Key? key}) : super(key: key);

  @override
  State<TeachersAttendance> createState() => _TeachersAttendanceState();
}

class _TeachersAttendanceState extends State<TeachersAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Coming soon'),
      ),
    );
  }
}
