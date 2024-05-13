import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mem_admain/core/networking/api_constant.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/group%20chat/data/models/creat_group_request_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/creat_group_response_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/delet_group_response_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_groups_response.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_User.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';
import 'package:mem_admain/feature/login/data/models/token_vaildate_response_body.dart';
import 'package:mem_admain/feature/meetings/data/models/delet_meeting_respons.dart';
import 'package:mem_admain/feature/meetings/data/models/get_all_meeting_respons_body.dart';
import 'package:mem_admain/feature/meetings/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/meetings/data/models/meeting_response_body.dart';
import 'package:mem_admain/feature/login/data/models/login_request_body.dart';
import 'package:mem_admain/feature/login/data/models/login_response_body.dart';
import 'package:mem_admain/feature/login/data/models/set_firebase_it_request_body.dart';
import 'package:mem_admain/feature/login/data/models/token_request_body.dart';
import 'package:mem_admain/feature/notification/data/models/delet_notification_respose_body.dart';
import 'package:mem_admain/feature/notification/data/models/get_all_notification_response_body.dart';
import 'package:mem_admain/feature/notification/data/models/notification_request_body.dart';
import 'package:mem_admain/feature/notification/data/models/notification_response_body.dart';
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
  Future<TokenVaildateResponseBody> vailadateToken(
    @Body() TokenRequestBody tokenRequestBody,
  );


  @POST(ApiConstants.setFireBaseId)
  Future setFirebaseId(
    @Header('Authorization') String token,
    @Body() SetFireBaseIdBodyRequest setFireBaseIdBodyRequest,
  );

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

  @POST(ApiConstants.creatNotifications)
  Future<NotificationResponseBody> createNotification(
    @Header('Authorization') String token,
    @Body() NotificationRequestModel notificationRequestModel,
  );

  @GET(ApiConstants.getAllNotifications)
  Future<List<GetAllNotificationResponse>> getAllNotification(
    @Header('Authorization') String token,
  );

  @DELETE("${ApiConstants.deleteNotifications}{id}")
  Future<DeletNotificationResponsBody> deleteNotification(
    @Header('Authorization') String token,
    @Path("id") String id,
  );

  @GET(ApiConstants.getAllUser)
  Future<List<GetAllUserResponse>> getAllUrser(
    @Header('Authorization') String token,
  );
  @POST(ApiConstants.creatGroup)
  Future<CreatGroupResponseBody> createGroup(
    @Header('Authorization') String token,
    @Body() CreatGroupRequestBody creatGroupRequestBody,
  );

  @GET(ApiConstants.getAllGroup)
  Future<List<GetAllGroupResponseBody>> getAllGroups(
    @Header('Authorization') String token,
  );

  @DELETE("${ApiConstants.deleteGroup}{id}")
  Future<DeletGroupResponse> deletGroup(
    @Header('Authorization') String token,
    @Path("id") String id,
  );




  @GET("${ApiConstants.getAllMessage}{id}/messages")
  Stream<List<MessageModel>> getAllMessage(
    @Header('Authorization') String token,
    @Path("id") String id,
  );
  //Exercises
  @GET(ApiConstants.getAllExercises)
  Future<List<ExerciseModel>> getAllExercises(
    @Header('Authorization') String token,
  );

  //delete exercise
  @DELETE("${ApiConstants.deleteExercise}{id}")
  Future<DeletGroupResponse> deletExercise(
    @Header('Authorization') String token,
    @Path("id") String id,
  );

  //create exercise
  @POST(ApiConstants.createExercise)
  @MultiPart()
  Future<ExerciseModel> createExercise(
    @Header('Authorization') String token,
    @Part() String name,
    @Part() String description,
    @Part() String type,
    @Part() File file,
  );

  //update exercise
  @PUT("${ApiConstants.updateExercise}{id}")
  @MultiPart()
  Future<ExerciseModel> updateExercise(
    @Header('Authorization') String token,
    @Path("id") String id,
    @Part() String name,
    @Part() String description,
    @Part() String type,
    @Part() File file,
  );
}
