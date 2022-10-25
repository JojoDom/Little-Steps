// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$StudentsService extends StudentsService {
  _$StudentsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StudentsService;

  @override
  Future<Response<dynamic>> checkIn(String accessToken, String studentCode) {
    final $url = '/students/${studentCode}/check-in';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> checkOut(String accessToken, String studentCode) {
    final $url = '/students/${studentCode}/check-out';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getStudent(String accessToken,
      {String? student_code}) {
    final $url = '/students/';
    final $params = <String, dynamic>{'student_code': student_code};
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
