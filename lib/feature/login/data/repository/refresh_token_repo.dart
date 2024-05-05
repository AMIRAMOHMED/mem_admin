// import 'package:mem_admain/core/networking/api_result.dart';
// import 'package:mem_admain/core/networking/api_services.dart';
// import 'package:mem_admain/feature/login/data/models/token_refresh_response_body.dart';
// import 'package:mem_admain/feature/login/data/models/token_request_body.dart';

// import '../../../../core/networking/api_error_handler.dart';

// class RefreshTokenRepo {
//   final ApiService apiService;

//   RefreshTokenRepo(this.apiService);

//   Future<ApiResult<TokenRefreshResponseBody>> refreshToken(
//       TokenRequestBody tokenRequestBody) async {
//     try {
//       final respons = await apiService.refreshToken(tokenRequestBody);
//       return ApiResult.success(respons);
//     } catch (error) {
//       return ApiResult.failure(ErrorHandler.handle(error));
//     }
//   }
// }
