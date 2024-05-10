
import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_User.dart';
import 'package:mem_admain/feature/meetings/data/models/delet_meeting_respons.dart';

import '../../../../core/networking/api_services.dart';

class GetAllUsersRepo {
  final ApiService _apiService;

  GetAllUsersRepo(this._apiService);

  Future<ApiResult<List<GetAllUserResponse>>> getAllUsersRepo(
      String token) async {
    try {

      final respons = await _apiService.getAllUrser(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

 
}
