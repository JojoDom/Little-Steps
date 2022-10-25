// ignore_for_file: non_constant_identifier_names

import 'package:chopper/chopper.dart';
import 'package:little_steps/utils/strings.dart';

part 'students_service.chopper.dart';

@ChopperApi(baseUrl: '/students')
abstract class StudentsService extends ChopperService {
  @Post(path: '/{studentCode}/check-in')
  Future<Response> checkIn(
      @Header('authorization') String accessToken, @Path() String studentCode);

  @Post(path: "/{studentCode}/check-out")
  Future<Response> checkOut(
      @Header('authorization') String accessToken, @Path() String studentCode);

  @Get(path: "/")
  Future<Response> getStudent(@Header('authorization') String accessToken,
      {@Query() String? student_code});

  static StudentsService create() {
    final client = ChopperClient(
        baseUrl: Constants.BASE_URL,
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$StudentsService(),
        ],
        converter: const JsonConverter());
    return _$StudentsService(client);
  }
}
