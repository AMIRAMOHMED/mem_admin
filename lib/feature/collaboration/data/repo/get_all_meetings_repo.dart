import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/feature/collaboration/data/models/get_all_meeting_respons_body.dart';

import '../../../../core/networking/api_services.dart';

class GetAllMeetingsRepo {
  final ApiService _apiService;

  GetAllMeetingsRepo(this._apiService);

  Future<ApiResult<List<GetAllMeetingResponseBody>>> getAllMeetingsrepo(
      String token) async {
    try {
      final respons = await _apiService.getAllMeetings(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
