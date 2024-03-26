// ignore_for_file: non_constant_identifier_names

import 'package:chopper/chopper.dart';
import 'package:little_steps/utils/strings.dart';

part 'teachers_attendance_service.chopper.dart';

@ChopperApi(baseUrl: '/teachers-attendance')
abstract class TeachersAttendanceService extends ChopperService {

  
  @Get(path: "/checked-in")
  Future<Response> getCheckedIn(@Header('authorization') String accessToken,
      {@Query() String? date});

   @Get(path: "/checked-out")
   Future<Response> getCheckedOut(@Header('authorization') String accessToken,
    {@Query() String? date});


  static TeachersAttendanceService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(Constants.BASE_URL),
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$TeachersAttendanceService(),
        ],
        converter: const JsonConverter());
    return _$TeachersAttendanceService(client);
  }
}
