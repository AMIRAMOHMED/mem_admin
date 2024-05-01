import 'package:dio/dio.dart';
import 'package:mem_admain/core/networking/api_constant.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_response_body.dart';
import 'package:mem_admain/feature/login/data/models/login_request_body.dart';
import 'package:mem_admain/feature/login/data/models/login_response_body.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.creatMeeting)
  Future<MeetingResponseBody> creatMeeting(
    @Header('Authorization') String token,
    @Body() MeetingRequestBody meetingRequestBody,
  );
}
