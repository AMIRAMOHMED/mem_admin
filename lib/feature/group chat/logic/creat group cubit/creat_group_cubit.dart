import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/group%20chat/data/models/creat_group_request_body.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/group_repo.dart';
import 'package:mem_admain/feature/group%20chat/logic/creat%20group%20cubit/creat_group_state.dart';

class CreatGroupCubit extends Cubit<CreatGroupState> {
  final GroupRepo _groupRepo;
  CreatGroupCubit(this._groupRepo) : super(const CreatGroupState.initial());
  final token = SharedPref().getString(PrefKeys.accessToken);
  final TextEditingController groupName = TextEditingController();

  void emitCreatGroupState(List<String> selectedUserIds) async {
    emit(const CreatGroupState.loading());
    final respons = await _groupRepo.creatGroup(
      "Bearer $token",
      CreatGroupRequestBody(
          name: groupName.text, selectedUserIds: selectedUserIds),
    );

    respons.when(success: (meetingResponseBody) {
      final meetingResponseBodyR = meetingResponseBody;

      emit(CreatGroupState.success(meetingResponseBodyR));
    }, failure: (error) {
      emit(CreatGroupState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
