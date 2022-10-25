import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:little_steps/utils/strings.dart';

part 'users_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UsersService extends ChopperService {
  @Get(path: '/')
  Future<Response> userIndex(@Header('authorization') String accessToken);

  @Post(path: '/')
  Future<Response> userStore(@Header('authorization') String accessToken,
      @Body() Map<String, dynamic> body);

  @Get(path: '/{id}')
  Future<Response> userShow(
      @Header('authorization') String accessToken,
       @Path() String id);

  @Put(path: '/{id}')
  Future<Response> userUpdate(
  @Header('authorization') String accessToken,
  @Path() String id,
  @Body() Map<String, dynamic> body);

  @Delete(path: '/{id}')
  Future<Response> userDelete(
    @Header('authorization') String accessToken,
    @Path() String id,);

  static UsersService create() {
    final client = ChopperClient(
        baseUrl: Constants.BASE_URL,
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$UsersService(),
        ],
        converter: const JsonConverter());
    return _$UsersService(client);
  }
}
