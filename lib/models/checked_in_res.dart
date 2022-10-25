// To parse this JSON data, do
//
//     final checkedInStudents = checkedInStudentsFromJson(jsonString);

import 'dart:convert';

CheckedInStudents checkedInStudentsFromJson(String str) => CheckedInStudents.fromJson(json.decode(str));

String checkedInStudentsToJson(CheckedInStudents data) => json.encode(data.toJson());

class CheckedInStudents {
    CheckedInStudents({
        required this.attendance,
    });

    List<Attendance> attendance;

    factory CheckedInStudents.fromJson(Map<String, dynamic> json) => CheckedInStudents(
        attendance: List<Attendance>.from(json["attendance"].map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
    };
}

class Attendance {
    Attendance({
        required this.checkinAt,
        required this.checkoutAt,
        required this.date,
        required this.updatedAt,
        required this.student,
    });

    DateTime checkinAt;
    DateTime checkoutAt;
    DateTime date;
    DateTime updatedAt;
    Student student;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        checkinAt: DateTime.parse(json["checkin_at"]),
        checkoutAt: DateTime.parse(json["checkout_at"]),
        date: DateTime.parse(json["date"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        student: Student.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "checkin_at": "${checkinAt.year.toString().padLeft(4, '0')}-${checkinAt.month.toString().padLeft(2, '0')}-${checkinAt.day.toString().padLeft(2, '0')}",
        "checkout_at": "${checkoutAt.year.toString().padLeft(4, '0')}-${checkoutAt.month.toString().padLeft(2, '0')}-${checkoutAt.day.toString().padLeft(2, '0')}",
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt.toIso8601String(),
        "student": student.toJson(),
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
        firstName: json["first_name"],
        lastName: json["last_name"],
        otherNames: json["other_names"],
        email: json["email"],
        id: json["id"],
        studentCode: json["student_code"],
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
