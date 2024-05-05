// import 'package:bloc/bloc.dart';
// import 'package:mem_admain/core/sharedpre/shared_pref.dart';
// import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
// import 'package:mem_admain/feature/login/data/models/token_request_body.dart';
// import 'package:mem_admain/feature/login/data/repository/refresh_token_repo.dart';
// import 'package:mem_admain/feature/login/logic/refresh_cubit/refresh_token_state.dart';

// class RefreshTokenCubit extends Cubit<RefreshTokenState> {
//   final RefreshTokenRepo _refreshTokenRepo;

//   RefreshTokenCubit(this._refreshTokenRepo)
//       : super(const RefreshTokenState.initial());

//   Future<void> refreshToken() async {
//     final token = SharedPref().getString(PrefKeys.accessToken);

//     emit(const RefreshTokenState.loading());
//     final response =
//         await _refreshTokenRepo.refreshToken(TokenRequestBody(token: token!));
//     response.when(
//       success: (refreshTokenResponse) async {
//         await SharedPref().setString(
//             PrefKeys.accessToken, refreshTokenResponse.newToken ?? '');
//         emit(RefreshTokenState.success(refreshTokenResponse));
//       },
//       failure: (error) {
//         emit(
//           RefreshTokenState.error(error: error.apiErrorModel.message ?? ''),
//         );
//       },
//     );
//   }
// }
