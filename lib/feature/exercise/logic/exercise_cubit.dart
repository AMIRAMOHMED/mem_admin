import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/data/repo/exercise_repo.dart';
import 'package:mem_admain/feature/exercise/logic/exercise_states.dart';

class ExerciseCubit extends Cubit<ExerciseStates> {
  final ExerciseRepo _exerciseRepo;

  ExerciseCubit(this._exerciseRepo) : super(const ExerciseStates.initial()) {
    fetchAllExercises();
  }

  final _allExercisesController = StreamController<List<ExerciseModel>>();

  Stream<List<ExerciseModel>> get allExercisesStream =>
      _allExercisesController.stream;

  final token = SharedPref().getString(PrefKeys.accessToken);

  void fetchAllExercises() async {
    emit(const ExerciseStates.loading());

    final response = await _exerciseRepo.getAllExercises("Bearer $token");

    response.when(
      success: (exercises) {
        _allExercisesController.add(exercises);
        emit(ExerciseStates.success(exercises));
      },
      failure: (error) {
        emit(ExerciseStates.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  //delete exercise
  void deleteExercise(String id) async {
    emit(const ExerciseStates.loading());

    final response = await _exerciseRepo.deleteExercise("Bearer $token", id);

    response.when(
      success: (data) {
        fetchAllExercises();
      },
      failure: (error) {
        emit(ExerciseStates.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  @override
  Future<void> close() {
    _allExercisesController.close();
    return super.close();
  }
}
