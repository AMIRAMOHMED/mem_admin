import 'package:freezed_annotation/freezed_annotation.dart';
part"get_all_meeting_state.freezed.dart";
@freezed
class GetAllMeetingState  <T> with _$GetAllMeetingState {
  const factory GetAllMeetingState.initial() = _Initial;
  const factory GetAllMeetingState.loading() = Loading;
  const factory GetAllMeetingState.success(T data) = Success<T>;
  const factory GetAllMeetingState.error({required String error}) = Error;
}
