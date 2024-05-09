import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/meetings/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/meetings/data/models/meeting_response_body.dart';

class CreetMeetingRepo {
  final ApiService apiService;

  CreetMeetingRepo(this.apiService);

  Future<ApiResult<MeetingResponseBody>> creatMeetingrepo(
      String token, MeetingRequestBody meetingRequestBody) async {
    try {
      final respons = await apiService.creatMeeting(token, meetingRequestBody);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
