
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mem_admain/core/app/cubit/selection_user_state.dart';

class SelectionUserCubit extends Cubit<SelectionUserState> {
  SelectionUserCubit() : super(const SelectionUserState.initial());

  String pickedChoose = ''; 
  Future<void> pickChoose(BuildContext context, String option) async {
    pickedChoose = option;
    emit(SelectionUserState.success(option));
  }

  String get pickedChooseValue => pickedChoose;
}
  