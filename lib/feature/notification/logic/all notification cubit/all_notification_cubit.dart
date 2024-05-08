import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/notification/data/models/get_all_notification_response_body.dart';
import 'package:mem_admain/feature/notification/data/repo/all_notification_repo.dart';
import 'package:mem_admain/feature/notification/logic/all%20notification%20cubit/all_notification_state.dart';



class AllNotificationCubit extends Cubit<AllNotificationState> {
  final AllNotificationRepo _allNotificationRepo ;
  AllNotificationCubit(this._allNotificationRepo) : super(const AllNotificationState.initial()){    _fetchNotification();
}
  final _allNotificationsController =
      StreamController<List<GetAllNotificationResponse>>();

  Stream<List<GetAllNotificationResponse>> get allNotificationsStream =>
      _allNotificationsController.stream;


  

  final token = SharedPref().getString(PrefKeys.accessToken);

  void _fetchNotification() async {
    emit(const AllNotificationState.loading());

    final response =
        await _allNotificationRepo.getAllNotification("Bearer $token");

    response.when(
      success: (getAllNotification) {
        _allNotificationsController.add(getAllNotification);
        emit(AllNotificationState.sucess(getAllNotification));
      },
      failure: (error) {
        emit(
            AllNotificationState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void deletNotification(String id) async {
    emit(const AllNotificationState.loading());

    final response = await _allNotificationRepo.deletNotification("Bearer $token", id);

    response.when(success: (deletmeetingresponsBody) {
      _fetchNotification();

      emit(AllNotificationState.sucess(deletmeetingresponsBody));
    }, failure: (error) {
      emit(AllNotificationState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    _allNotificationsController.close();
    return super.close();
  }


}
