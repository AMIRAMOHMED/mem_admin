import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';

part 'exercise_states.freezed.dart';

@freezed
class ExerciseStates {
  const factory ExerciseStates.initial() = _Initial;
  const factory ExerciseStates.loading() = Loading;
  const factory ExerciseStates.success(List<ExerciseModel> data) = Success;
  const factory ExerciseStates.error({required String error}) = Error;
}
