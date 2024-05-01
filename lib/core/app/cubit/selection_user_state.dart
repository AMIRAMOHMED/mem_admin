import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_user_state.freezed.dart';

@freezed
class SelectionUserState<T> with _$SelectionUserState {
  const factory SelectionUserState.initial() = _Initial;
  const factory SelectionUserState.loading() = Loading;
  const factory SelectionUserState.success(T data) = Success<T>;
  const factory SelectionUserState.error({required String error}) = Error;
}
