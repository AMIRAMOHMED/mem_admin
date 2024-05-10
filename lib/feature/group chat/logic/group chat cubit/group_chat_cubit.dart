import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_groups_response.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/group_repo.dart';
import 'package:mem_admain/feature/group%20chat/logic/group%20chat%20cubit/group_chat_state.dart';

class GroupChatCubit extends Cubit<GroupChatState> {
  final GroupRepo _groupRepo;
  final _allMGroupsController =
      StreamController<List<GetAllGroupResponseBody>>();

  Stream<List<GetAllGroupResponseBody>> get allGroupsStream =>
      _allMGroupsController.stream;
  GroupChatCubit(this._groupRepo) : super(const GroupChatState.initial()) {
    
    _fetchGroups();
  }

  final token = SharedPref().getString(PrefKeys.accessToken);

  void _fetchGroups() async {
    emit(const GroupChatState.loading());

    final response = await _groupRepo.getAllGroups("Bearer $token");

    response.when(
      success: (getAllGroupResponseBody) {
        _allMGroupsController.add(getAllGroupResponseBody);
        emit(GroupChatState.success(getAllGroupResponseBody));
      },
      failure: (error) {
        emit(GroupChatState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void deletMeeting(String id) async {
    emit(const GroupChatState.loading());

    final response = await _groupRepo.deletGroup("Bearer $token", id);

    response.when(success: (deletGroupresponsBody) {
      _fetchGroups();

      emit(GroupChatState.success(deletGroupresponsBody));
    }, failure: (error) {
      emit(GroupChatState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    _allMGroupsController.close();
    return super.close();
  }
}
