import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/get_all_user_repo.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_state.dart';


class AllUserCubit extends Cubit<AllUserState> {
  final GetAllUsersRepo _getAllUsersRepo ;
  AllUserCubit(this._getAllUsersRepo) : super(const AllUserState.initial());




  void getAllUser() async {
    emit(const AllUserState.loading());

    final token = SharedPref().getString(PrefKeys.accessToken);

    final response = await _getAllUsersRepo.getAllUsersRepo("Bearer $token");

    response.when(
      success: (getAllUser) {
        emit(AllUserState.success(getAllUser));
      },
      failure: (error) {
        emit(AllUserState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

