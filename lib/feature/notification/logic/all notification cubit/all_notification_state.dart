import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_notification_state.freezed.dart';
@freezed
class AllNotificationState<T> with _$AllNotificationState {
  const factory AllNotificationState.initial() = _Initial;
    const factory AllNotificationState.loading() = Loading;
  const factory AllNotificationState.sucess(T data) = Success<T>;
  const factory AllNotificationState.error({required String error}) = Error;
}
