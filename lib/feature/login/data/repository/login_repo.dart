import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/login/data/models/login_request_body.dart';
import 'package:mem_admain/feature/login/data/models/login_response_body.dart';

import '../../../../core/networking/api_error_handler.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final respons = await apiService.login(loginRequestBody);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
