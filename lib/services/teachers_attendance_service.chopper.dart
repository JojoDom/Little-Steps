// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers_attendance_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$TeachersAttendanceService extends TeachersAttendanceService {
  _$TeachersAttendanceService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TeachersAttendanceService;

  @override
  Future<Response<dynamic>> getCheckedIn(String accessToken, {String? date}) {
    final $url = '/teachers-attendance/checked-in';
    final $params = <String, dynamic>{'date': date};
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCheckedOut(String accessToken, {String? date}) {
    final $url = '/teachers-attendance/checked-out';
    final $params = <String, dynamic>{'date': date};
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
