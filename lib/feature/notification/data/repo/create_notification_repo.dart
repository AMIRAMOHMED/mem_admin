

import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/notification/data/models/notification_request_body.dart';
import 'package:mem_admain/feature/notification/data/models/notification_response_body.dart';

class NotificationRepo{

  ApiService _apiService;
  NotificationRepo(this._apiService);



Future<ApiResult<NotificationResponseBody>> createNotificationrepo(


   String token, NotificationRequestModel notificationRequestModel
) async {
  try{
  final reponse =await _apiService.createNotification(token, notificationRequestModel);
  return ApiResult.success(reponse);
  }
  catch(error){
    return ApiResult.failure(ErrorHandler.handle(error));
  }
}

}