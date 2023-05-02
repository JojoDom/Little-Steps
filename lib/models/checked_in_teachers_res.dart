// To parse this JSON data, do
//
//     final checkedInStudents = checkedInStudentsFromJson(jsonString);

import 'dart:convert';

CheckInTeacher checkInTeacherFromJson(String str) =>
    CheckInTeacher.fromJson(json.decode(str));

String checkInTeacherToJson(CheckInTeacher data) =>
    json.encode(data.toJson());

class CheckInTeacher {
  CheckInTeacher({
    required this.attendance,
  });

  List<TeacherAttendanceRes> attendance;

  factory CheckInTeacher.fromJson(Map<String, dynamic> json) =>
      CheckInTeacher(
        attendance: List<TeacherAttendanceRes>.from(
            json["attendance"].map((x) => TeacherAttendanceRes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
      };
}

class TeacherAttendanceRes {
  TeacherAttendanceRes({
    required this.checkinAt,
    required this.checkoutAt,
    required this.date,
    required this.updatedAt,
    required this.teacher,
    required this.createdAt,
  });

  String checkinAt;
  String checkoutAt;
  String date;
  DateTime updatedAt;
  TeacherAttendance teacher;
  DateTime createdAt;

  factory TeacherAttendanceRes.fromJson(Map<String, dynamic> json) => TeacherAttendanceRes(
        checkinAt: json["checkin_at"],
        createdAt: DateTime.parse(json["created_at"]),
        checkoutAt: json["checkout_at"] ?? '',
        date: json["date"],
        updatedAt: DateTime.parse(json["updated_at"]),
        teacher: TeacherAttendance.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "checkin_at": checkinAt,
        "checkout_at": checkoutAt,
        "date": date,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "teacher": teacher.toJson(),
      };
}

class TeacherAttendance {
  TeacherAttendance(
      {required this.firstName,
      required this.lastName,
      required this.otherNames,
      this.email,
      this.id,
      this.teacherCode});

  String firstName;
  String lastName;
  dynamic otherNames;
  String? email;
  int? id;
  String? teacherCode;

  factory TeacherAttendance.fromJson(Map<String, dynamic> json) => TeacherAttendance(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        otherNames: json["other_names"]??'',
        email: json["email"],
        id: json["id"],
        teacherCode: json["teacher_code"] ?? '',
        
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "other_names": otherNames,
        "email": email,
        "id": id,
        "teacher_code": teacherCode,
      };
}
