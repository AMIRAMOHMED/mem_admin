import 'package:freezed_annotation/freezed_annotation.dart';


part 'all_user_state.freezed.dart';
@freezed
class AllUserState<T> with _$AllUserState {
  const factory AllUserState.initial() = _Initial;

    const factory AllUserState.loading() = Loading;
  const factory AllUserState.success(T data) = Success<T>;
  const factory AllUserState.error({required String error}) = Error;

}
