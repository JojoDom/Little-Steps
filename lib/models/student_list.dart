// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

StudentsAndTeachers studentsFromJson(String str) =>
    StudentsAndTeachers.fromJson(json.decode(str));

String studentsToJson(StudentsAndTeachers data) => json.encode(data.toJson());

class StudentsAndTeachers {
  StudentsAndTeachers({
    required this.students,
  });

  List<StudentTeacher> students;

  factory StudentsAndTeachers.fromJson(Map<String, dynamic> json) =>
      StudentsAndTeachers(
        students: List<StudentTeacher>.from(
            json["students"].map((x) => StudentTeacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}

class StudentTeacher {
  StudentTeacher(
      {required this.firstName,
      required this.lastName,
      required this.otherNames,
      required this.email,
      required this.id,
      this.studentCode,
      this.teacherCode});

  String firstName;
  String lastName;
  dynamic otherNames;
  String email;
  int id;
  String? studentCode;
  String? teacherCode;

  factory StudentTeacher.fromJson(Map<String, dynamic> json) => StudentTeacher(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        otherNames: json["other_names"],
        email: json["email"] ?? '',
        id: json["id"] ?? 0,
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
        "teacher_code" : teacherCode
      };
}
