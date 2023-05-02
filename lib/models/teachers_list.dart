// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

Teachers teachersFromJson(String str) => Teachers.fromJson(json.decode(str));

String studentsToJson(Teachers data) => json.encode(data.toJson());

class Teachers {
  Teachers({
    required this.teachers,
  });

  List<Teacher> teachers;

  factory Teachers.fromJson(Map<String, dynamic> json) => Teachers(
        teachers: List<Teacher>.from(
            json["teachers"].map((x) => Teacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
      };
}

class Teacher {
  Teacher(
      {required this.firstName,
      required this.lastName,
      required this.otherNames,
      required this.email,
      required this.id,
      this.teacherCode,
      this.phone});

  String firstName;
  String lastName;
  dynamic otherNames;
  String email;
  String? phone;
  int id;
  String? teacherCode;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        otherNames: json["other_names"],
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        id: json["id"] ?? 0,
        teacherCode: json["teacher_code"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "other_names": otherNames,
        "email": email,
        "phone" : phone,
        "id": id,
        "teacher_code": teacherCode,
      };
}
