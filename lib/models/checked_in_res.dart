// To parse this JSON data, do
//
//     final checkedInStudents = checkedInStudentsFromJson(jsonString);

import 'dart:convert';

CheckedIn checkedInStudentsFromJson(String str) =>
    CheckedIn.fromJson(json.decode(str));

String checkedInStudentsToJson(CheckedIn data) =>
    json.encode(data.toJson());

class CheckedIn {
  CheckedIn({
    required this.attendance,
  });

  List<AttendanceRes> attendance;

  factory CheckedIn.fromJson(Map<String, dynamic> json) =>
      CheckedIn(
        attendance: List<AttendanceRes>.from(
            json["attendance"].map((x) => AttendanceRes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
      };
}

class AttendanceRes {
  AttendanceRes({
    required this.checkinAt,
    required this.checkoutAt,
    required this.date,
    required this.updatedAt,
    required this.studentAndTeacher,
    required this.createdAt,
  });

  String checkinAt;
  String checkoutAt;
  String date;
  DateTime updatedAt;
  StudentAndTeacherData studentAndTeacher;
  DateTime createdAt;

  factory AttendanceRes.fromJson(Map<String, dynamic> json) => AttendanceRes(
        checkinAt: json["checkin_at"],
        createdAt: DateTime.parse(json["created_at"]),
        checkoutAt: json["checkout_at"] ?? '',
        date: json["date"],
        updatedAt: DateTime.parse(json["updated_at"]),
        studentAndTeacher: StudentAndTeacherData.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "checkin_at": checkinAt,
        "checkout_at": checkoutAt,
        "date": date,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "student": studentAndTeacher.toJson(),
      };
}

class StudentAndTeacherData {
  StudentAndTeacherData(
      {required this.firstName,
      required this.lastName,
      required this.otherNames,
      this.email,
      this.id,
      this.studentCode,
      this.teacherCode});

  String firstName;
  String lastName;
  dynamic otherNames;
  String? email;
  int? id;
  String? studentCode;
  String? teacherCode;

  factory StudentAndTeacherData.fromJson(Map<String, dynamic> json) => StudentAndTeacherData(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        otherNames: json["other_names"],
        email: json["email"],
        id: json["id"],
        studentCode: json["student_code"] ?? '',
        teacherCode: json["teacher_code"] ?? '',
        
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "other_names": otherNames,
        "email": email,
        "id": id,
        "student_code": studentCode,
        "teacher_code": teacherCode
      };
}
