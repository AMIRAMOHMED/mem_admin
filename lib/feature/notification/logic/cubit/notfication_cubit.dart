
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/notification/data/models/notification_request_body.dart';
import 'package:mem_admain/feature/notification/data/repo/create_notification_repo.dart';
import 'package:mem_admain/feature/notification/logic/cubit/notfication_state.dart';

class NotficationCubit extends Cubit<NotficationState> {
  final NotificationRepo _notificationRepo;
  NotficationCubit(this._notificationRepo)
      : super(const NotficationState.initial());

  final TextEditingController messageNotification = TextEditingController();

  void emitCreatNotificationState(BuildContext context) async {
    emit(const NotficationState.loading());
    final token = SharedPref().getString(PrefKeys.accessToken);

    final forWho = context.read<SelectionUserCubit>().pickedChooseValue;
    final respons = await _notificationRepo.createNotificationrepo(
      "Bearer $token",
      NotificationRequestModel(
        message: messageNotification.text,
        forWho: forWho,
      ),
    );

    respons.when(success: (notificationResponseBody) {
      final notificationResponseBodyR = notificationResponseBody;

      emit(NotficationState.sucess(notificationResponseBodyR));
    }, failure: (error) {
      emit(NotficationState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
