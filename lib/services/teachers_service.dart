// ignore_for_file: non_constant_identifier_names

import 'package:chopper/chopper.dart';
import 'package:little_steps/utils/strings.dart';

part 'teachers_service.chopper.dart';

@ChopperApi(baseUrl: '/teachers')
abstract class TeachersService extends ChopperService {
  @Post(path: '/{teacher_code}/check-in')
  Future<Response> checkIn(
      @Header('authorization') String accessToken, @Path() String studentCode);

  @Post(path: "/{teacher_code}/check-out")
  Future<Response> checkOut(
      @Header('authorization') String accessToken, @Path() String studentCode);

  @Get(path: "/")
  Future<Response> getTeachers(@Header('authorization') String accessToken,
      {@Query() String? student_code});

  static TeachersService create() {
    final client = ChopperClient(
        baseUrl: Constants.BASE_URL,
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$TeachersService(),
        ],
        converter: const JsonConverter());
    return _$TeachersService(client);
  }
}
