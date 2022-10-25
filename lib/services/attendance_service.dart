// ignore_for_file: non_constant_identifier_names

import 'package:chopper/chopper.dart';
import 'package:little_steps/utils/strings.dart';

part 'attendance_service.chopper.dart';

@ChopperApi(baseUrl: '/attendance')
abstract class AttendanceService extends ChopperService {

  
  @Get(path: "/checked-in")
  Future<Response> getCheckedIn(@Header('authorization') String accessToken,
      {@Query() String? date});

   @Get(path: "/checked-out")
   Future<Response> getCheckedOut(@Header('authorization') String accessToken,
    {@Query() String? date});


  static AttendanceService create() {
    final client = ChopperClient(
        baseUrl: Constants.BASE_URL,
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$AttendanceService(),
        ],
        converter: const JsonConverter());
    return _$AttendanceService(client);
  }
}
