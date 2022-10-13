import 'package:chopper/chopper.dart';
import 'package:little_steps/utils/strings.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '/auth')
abstract class AuthService extends ChopperService {
  @Post(path: '/register')
  Future<Response> register(
    @Header('authorization') String accessToken,
    @Body() Map<String, dynamic> body);

  @Post(path: '/login')
  Future<Response> login(
  @Header('authorization') String accessToken,
  @Body() Map<String, dynamic> body); 


  static AuthService create() {
    final client = ChopperClient(
        baseUrl: Constants.BASE_URL ,
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        services: [
          _$AuthService(),
        ],
        converter: const JsonConverter());
    return _$AuthService(client);
  }  
}
