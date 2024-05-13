import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_exercise_states.freezed.dart';
@freezed

class CreateExerciseStates  <T> with _$CreateExerciseStates{
  const factory CreateExerciseStates.initial() = _Initial;
  const factory CreateExerciseStates.loading() = Loading;
  const factory CreateExerciseStates.success(T data) = Success;
  const factory CreateExerciseStates.imagePicked(T data ) = ImagePicked;
  const factory CreateExerciseStates.error({required String error}) = Error;
}


