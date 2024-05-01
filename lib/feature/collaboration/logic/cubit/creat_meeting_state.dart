import 'package:freezed_annotation/freezed_annotation.dart';
part 'creat_meeting_state.freezed.dart';
@freezed
class CreatMeetingState<T> with _$CreatMeetingState {
  const factory CreatMeetingState.initial() = _Initial;
    const factory CreatMeetingState.loading() = Loading;
  const factory CreatMeetingState.success(T data) = Success<T>;
  const factory CreatMeetingState.error({required String error}) = Error;

}
