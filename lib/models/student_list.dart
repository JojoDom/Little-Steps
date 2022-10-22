// To parse this JSON data, do
//
//     final students = studentsFromJson(jsonString);

import 'dart:convert';

List<Students> studentsFromJson(String str) => List<Students>.from(json.decode(str).map((x) => Students.fromJson(x)));

String studentsToJson(List<Students> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Students {
    Students({
        required this.updatedAt,
        required this.id,
        required this.studentCode,
        required this.firstName,
        required this.lastName,
        required this.otherNames,
        required this.email,
        required this.guardians,
        required this.attendance,
    });

    DateTime updatedAt;
    int id;
    String studentCode;
    String firstName;
    String lastName;
    dynamic otherNames;
    String email;
    List<dynamic> guardians;
    List<Attendance> attendance;

    factory Students.fromJson(Map<String, dynamic> json) => Students(
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        studentCode: json["student_code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        otherNames: json["other_names"],
        email: json["email"],
        guardians: List<dynamic>.from(json["guardians"].map((x) => x)),
        attendance: List<Attendance>.from(json["attendance"].map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
        "student_code": studentCode,
        "first_name": firstName,
        "last_name": lastName,
        "other_names": otherNames,
        "email": email,
        "guardians": List<dynamic>.from(guardians.map((x) => x)),
        "attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
    };
}

class Attendance {
    Attendance({
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.id,
        required this.date,
        required this.checkinAt,
        required this.checkoutAt,
    });

    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int id;
    DateTime date;
    DateTime checkinAt;
    DateTime checkoutAt;

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        id: json["id"],
        date: DateTime.parse(json["date"]),
        checkinAt: DateTime.parse(json["checkin_at"]),
        checkoutAt: DateTime.parse(json["checkout_at"]),
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "checkin_at": checkinAt.toIso8601String(),
        "checkout_at": checkoutAt.toIso8601String(),
    };
}
