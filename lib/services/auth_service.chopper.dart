// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthService;

  @override
  Future<Response<dynamic>> register(
      String accessToken, Map<String, dynamic> body) {
    final $url = '/auth/register';
    final $headers = {
      'authorization': accessToken,
    };

    final $body = body;
    final $request =
        Request('POST', Uri.parse($url), client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> login(Map<String, dynamic> body) {
    final $url = '/auth/login';
    final $body = body;
    final $request = Request('POST', Uri.parse($url), client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
