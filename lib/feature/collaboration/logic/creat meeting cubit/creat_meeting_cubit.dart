import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/collaboration/data/models/meeting_request_body.dart';
import 'package:mem_admain/feature/collaboration/data/repo/creat_meeting_repo.dart';
import 'package:mem_admain/feature/collaboration/logic/creat%20meeting%20cubit/creat_meeting_state.dart';

import '../../../../core/app/cubit/selection_user_cubit.dart';

class CreatMeetingCubit extends Cubit<CreatMeetingState> {
  final CreetMeetingRepo _creatMeetingRepo;

  CreatMeetingCubit(
    this._creatMeetingRepo,
  ) : super(const CreatMeetingState.initial());

  final token = SharedPref().getString(PrefKeys.accessToken);
  final TextEditingController meetingName = TextEditingController();
  final TextEditingController urlOfMeeting = TextEditingController();

  void emitCreatMeetingState(
      BuildContext context, String data, TimeOfDay dataTime) async {
    emit(const CreatMeetingState.loading());
    final forWho = context.read<SelectionUserCubit>().pickedChooseValue;

    String combinedDateTime = combineDateAndTime(data, dataTime);

    final respons = await _creatMeetingRepo.creatMeetingrepo(
      "Bearer $token",
      MeetingRequestBody(
          url: urlOfMeeting.text,
          name: meetingName.text,
          forWho: forWho,
          dateTime: combinedDateTime,
          message: 'messge',
          selectedUserIds: []),
    );
    print(respons);
    respons.when(success: (meetingResponseBody) {
      final meetingResponseBodyR = meetingResponseBody;

      emit(CreatMeetingState.success(meetingResponseBodyR));
    }, failure: (error) {
      emit(CreatMeetingState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}

String combineDateAndTime(String date, TimeOfDay time) {
  DateTime dateTime = DateTime.parse(date);

  dateTime = DateTime(
      dateTime.year, dateTime.month, dateTime.day, time.hour, time.minute);

  String formattedDateTime = dateTime.toUtc().toIso8601String();

  return formattedDateTime;
}
