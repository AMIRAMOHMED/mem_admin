import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_exercise_states.freezed.dart';

@freezed
class CreateExerciseStates {
  const factory CreateExerciseStates.initial() = _Initial;
  const factory CreateExerciseStates.loading() = Loading;
  const factory CreateExerciseStates.success(dynamic data) = Success;
  const factory CreateExerciseStates.imagePicked(File image) = ImagePicked;
  const factory CreateExerciseStates.error({required String error}) = Error;
}
