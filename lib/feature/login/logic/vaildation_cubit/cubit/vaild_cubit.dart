
import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/login/data/models/token_request_body.dart';
import 'package:mem_admain/feature/login/data/repository/vaildate_token_repo.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_state.dart';

class VaildCubit extends Cubit<VaildState> {
  final VaildateTokenRepo _validateTokenRepo;

  VaildCubit(this._validateTokenRepo) : super(const VaildState.initial());

  Future<void> checkValidationToken() async {
    final token = SharedPref().getString(PrefKeys.accessToken);
    emit(const VaildState.loading());

    final response =
        await _validateTokenRepo.vaildateToken(TokenRequestBody(token: token!));


  }
}
