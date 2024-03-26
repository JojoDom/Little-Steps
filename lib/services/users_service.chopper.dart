// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$UsersService extends UsersService {
  _$UsersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UsersService;

  @override
  Future<Response<dynamic>> userIndex(String accessToken) {
    final $url = '/users/';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', Uri.parse($url), client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userStore(
      String accessToken, Map<String, dynamic> body) {
    final $url = '/users/';
    final $headers = {
      'authorization': accessToken,
    };

    final $body = body;
    final $request =
        Request('POST', Uri.parse($url), client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userShow(String accessToken, String id) {
    final $url = '/users/${id}';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('GET', Uri.parse($url), client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userUpdate(
      String accessToken, String id, Map<String, dynamic> body) {
    final $url = '/users/${id}';
    final $headers = {
      'authorization': accessToken,
    };

    final $body = body;
    final $request =
        Request('PUT', Uri.parse($url), client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> userDelete(String accessToken, String id) {
    final $url = '/users/${id}';
    final $headers = {
      'authorization': accessToken,
    };

    final $request = Request('DELETE', Uri.parse($url), client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
