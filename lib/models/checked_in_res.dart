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

    List<AttendanceRes> attendance;

    factory CheckedInStudents.fromJson(Map<String, dynamic> json) => CheckedInStudents(
        attendance: List<AttendanceRes>.from(json["attendance"].map((x) => AttendanceRes.fromJson(x))),
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
        required this.student,
        required this.createdAt,
    });

    String checkinAt;
    String checkoutAt;
    String date;
    DateTime updatedAt;
    StudentData student;
    DateTime createdAt;

    factory AttendanceRes.fromJson(Map<String, dynamic> json) => AttendanceRes(
        checkinAt: json["checkin_at"],
        createdAt: DateTime.parse(json["created_at"]),
        checkoutAt: json["checkout_at"]??'',
        date: json["date"],
         updatedAt: DateTime.parse(json["updated_at"]),
        student: StudentData.fromJson(json["student"]),
    );

    Map<String, dynamic> toJson() => {
        "checkin_at":  checkinAt,
        "checkout_at": checkoutAt,
        "date": date,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "student": student.toJson(),
    };
}

class StudentData {
    StudentData({
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

    factory StudentData.fromJson(Map<String, dynamic> json) => StudentData(
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
