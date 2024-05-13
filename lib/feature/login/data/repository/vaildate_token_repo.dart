import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/login/data/models/set_firebase_it_request_body.dart';
import 'package:mem_admain/feature/login/data/models/token_request_body.dart';

import '../../../../core/networking/api_error_handler.dart';

class VaildateTokenRepo {
  final ApiService apiService;

  VaildateTokenRepo(this.apiService);

  Future<ApiResult> vaildateToken(
      TokenRequestBody tokenRequestBody) async {
    try {
      final respons = await apiService.vailadateToken(tokenRequestBody);
    
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


   Future setFirebaseId(String token, SetFireBaseIdBodyRequest setFireBaseIdBodyRequest) async {
    await apiService.setFirebaseId(  token,setFireBaseIdBodyRequest);
  }

}
