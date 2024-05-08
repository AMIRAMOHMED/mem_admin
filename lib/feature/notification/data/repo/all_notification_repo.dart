import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/feature/notification/data/models/delet_notification_respose_body.dart';
import 'package:mem_admain/feature/notification/data/models/get_all_notification_response_body.dart';

import '../../../../core/networking/api_services.dart';

class AllNotificationRepo{

  final ApiService _apiService;

  AllNotificationRepo(this._apiService);



  Future<ApiResult<List<GetAllNotificationResponse>>> getAllNotification(
    String token) async {

    try{
    final reponse =await _apiService.getAllNotification(token);
    return ApiResult.success(reponse);
    
    }
    catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
    }

    Future<ApiResult<DeletNotificationResponsBody>> deletNotification(
      String token,  id) async {
    try {
      final respons = await _apiService.deleteNotification(token, id);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}