// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TeachersService extends TeachersService {
  _$TeachersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TeachersService;

  @override
  Future<Response<dynamic>> checkIn(String accessToken, String teacherCode) {
    final $url = '/teachers/${teacherCode}/check-in';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> checkOut(String accessToken, String teacherCode) {
    final $url = '/teachers/${teacherCode}/check-out';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTeachers(String accessToken,
      {String? student_code}) {
    final $url = '/teachers/';
    final $params = <String, dynamic>{'student_code': student_code};
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
