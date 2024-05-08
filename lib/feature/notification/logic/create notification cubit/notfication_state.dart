import 'package:freezed_annotation/freezed_annotation.dart';
part 'notfication_state.freezed.dart';

@freezed
class NotficationState<T> with _$NotficationState {
  const factory NotficationState.initial() = _Initial;
  const factory NotficationState.loading() = Loading;
  const factory NotficationState.sucess(T data) = Success<T>;
  const factory NotficationState.error({required String error}) = Error;
}
