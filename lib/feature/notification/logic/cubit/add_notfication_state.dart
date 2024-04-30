import 'package:freezed_annotation/freezed_annotation.dart';


part 'add_notfication_state.freezed.dart';
@freezed
class AddNotficationState<T> with _$AddNotficationState {
  const factory AddNotficationState.initial() = _Initial;
  const factory AddNotficationState.loading() = Loading;
    const factory AddNotficationState.sucess(T data) = Success<T>;
      const factory AddNotficationState.error({required String error}) = Error;



}
