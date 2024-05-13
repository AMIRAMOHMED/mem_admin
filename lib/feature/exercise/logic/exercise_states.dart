import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_states.freezed.dart';


@freezed
class ExerciseStates<T>with _$ExerciseStates<T>{ 

  const factory ExerciseStates.initial() = _Initial;
  const factory ExerciseStates.loading() = Loading;
  const factory ExerciseStates.success(T data) = Success;
  const factory ExerciseStates.error({required String error}) = Error;
}
