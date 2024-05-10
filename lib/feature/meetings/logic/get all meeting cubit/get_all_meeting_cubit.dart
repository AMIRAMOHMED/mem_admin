import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/meetings/data/models/get_all_meeting_respons_body.dart';
import 'package:mem_admain/feature/meetings/data/repo/get_all_meetings_repo.dart';
import 'package:mem_admain/feature/meetings/logic/get%20all%20meeting%20cubit/get_all_meeting_state.dart';

class GetAllMeetingCubit extends Cubit<GetAllMeetingState> {
  final GetAllMeetingsRepo _getAllMeetingsRepo;
  final _allMeetingsController =
      StreamController<List<GetAllMeetingResponseBody>>();

  Stream<List<GetAllMeetingResponseBody>> get allMeetingsStream =>
      _allMeetingsController.stream;

  GetAllMeetingCubit(this._getAllMeetingsRepo, )
      : super(const GetAllMeetingState.initial()) {
    fetchMeetings();
  }

  final token = SharedPref().getString(PrefKeys.accessToken);

  void fetchMeetings() async {
    emit(const GetAllMeetingState.loading());

    final response =
        await _getAllMeetingsRepo.getAllMeetingsrepo("Bearer $token");

    response.when(
      success: (getAllMeetingModel) {
        _allMeetingsController.add(getAllMeetingModel);
        emit(GetAllMeetingState.success(getAllMeetingModel));
      },
      failure: (error) {
        emit(
            GetAllMeetingState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void deletMeeting(String id) async {
    emit(const GetAllMeetingState.loading());

    final response = await _getAllMeetingsRepo.deletMeeting("Bearer $token", id);

    response.when(success: (deletmeetingresponsBody) {
      fetchMeetings();

      emit(GetAllMeetingState.success(deletmeetingresponsBody));
    }, failure: (error) {
      emit(GetAllMeetingState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    _allMeetingsController.close();
    return super.close();
  }
}
