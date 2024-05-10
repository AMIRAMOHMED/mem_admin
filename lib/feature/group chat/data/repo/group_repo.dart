import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/group%20chat/data/models/creat_group_request_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/creat_group_response_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/delet_group_response_body.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_groups_response.dart';

class GroupRepo {
  final ApiService _apiService;

  GroupRepo(this._apiService);

  Future<ApiResult<CreatGroupResponseBody>> creatGroup(
      String token, CreatGroupRequestBody creatGroupRequestBody) async {
    try {
      final respons =
          await _apiService.createGroup(token, creatGroupRequestBody);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<GetAllGroupResponseBody>>> getAllGroups(
      String token) async {
    try {
      final respons = await _apiService.getAllGroups(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DeletGroupResponse>> deletGroup(String token, id) async {
    try {
      final respons = await _apiService.deletGroup(token, id);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
