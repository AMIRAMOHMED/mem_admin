import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/collaboration/data/repo/creat_meeting_repo.dart';
import 'package:mem_admain/feature/collaboration/logic/cubit/creat_meeting_state.dart';

class CreatMeetingCubit extends Cubit<CreatMeetingState> {
  final CreetMeetingRepo _creatMeetingRepo;

  CreatMeetingCubit(this._creatMeetingRepo)
      : super(const CreatMeetingState.initial());

  final token = SharedPref().getString(PrefKeys.accessToken);
  void emitCreatMeetingState() async {
    emit(const CreatMeetingState.loading());
    final respons = await _creatMeetingRepo.creatMeetingrepo(
      "Bearer $token",
      MeetingRequestBody(
          url: 'hdmfb',
          name: 'mohamed',
          forWho: 'all',
          dateTime: '2014-02-15 08:57:47.812',
          message: 'cjkndvnd,mm',
          selectedUserIds: []),
    );
    respons.when(success: (meetingResponseBody) {
      final meetingResponseBodyR = meetingResponseBody;
      log(meetingResponseBodyR.toString());

      emit(CreatMeetingState.success(meetingResponseBodyR));
    }, failure: (error) {
      emit(CreatMeetingState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
