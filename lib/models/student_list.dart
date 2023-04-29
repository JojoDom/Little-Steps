// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

Students studentsFromJson(String str) => Students.fromJson(json.decode(str));

String studentsToJson(Students data) => json.encode(data.toJson());

class Students {
    Students({
       required  this.students,
    });

    List<Student> students;

    factory Students.fromJson(Map<String, dynamic> json) => Students(
        students: List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
    };
}

class Student {
    Student({
        required this.firstName,
        required this.lastName,
        required this.otherNames,
        required this.email,
        required this.id,
        required this.studentCode,
    });

    String firstName;
    String lastName;
    dynamic otherNames;
    String email;
    int id;
    String studentCode;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        firstName: json["first_name"]??'',
        lastName: json["last_name"]??'',
        otherNames: json["other_names"],
        email: json["email"]??'',
        id: json["id"]??0,
        studentCode: json["student_code"]??'',
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "other_names": otherNames,
        "email": email,
        "id": id,
        "student_code": studentCode,
    };
}
