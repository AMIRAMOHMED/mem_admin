
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creat_group_state.freezed.dart';
@freezed
class CreatGroupState<T> with _$CreatGroupState {
  const factory CreatGroupState.initial() = _Initial;
    const factory CreatGroupState.loading() = Loading;
  const factory CreatGroupState.success(T data) = Success<T>;
  const factory CreatGroupState.error({required String error}) = Error;
}
