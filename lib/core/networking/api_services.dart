import 'package:dio/dio.dart';
import 'package:mem_admain/core/networking/api_constant.dart';
import 'package:mem_admain/feature/collaboration/data/models/delet_meeting_respons.dart';
import 'package:mem_admain/feature/collaboration/data/models/get_all_meeting_respons_body.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_response_body.dart';
import 'package:mem_admain/feature/login/data/models/login_request_body.dart';
import 'package:mem_admain/feature/login/data/models/login_response_body.dart';
import 'package:mem_admain/feature/login/data/models/token_request_body.dart';
import 'package:mem_admain/feature/login/data/models/token_vaildate_response_body.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.vaildateToken)
  Future vailadateToken(
    @Body() TokenRequestBody tokenRequestBody,
  );

  // @POST(ApiConstants.refreshToken)
  // Future<TokenRefreshResponseBody> refreshToken(
  //   @Body() TokenRequestBody tokenRequestBody,
  // );

  @POST(ApiConstants.creatMeeting)
  Future<MeetingResponseBody> creatMeeting(
    @Header('Authorization') String token,
    @Body() MeetingRequestBody meetingRequestBody,
  );

  @GET(ApiConstants.getAllMeetings)
  Future<List<GetAllMeetingResponseBody>> getAllMeetings(
    @Header('Authorization') String token,
  );

 @DELETE("${ApiConstants.deleteMeeting}{id}")
Future<DeletMeetingResponsBody> deleteMeeting(
  @Header('Authorization') String token,
  @Path("id") String id,
);

}
