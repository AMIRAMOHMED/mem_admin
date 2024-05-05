import 'package:freezed_annotation/freezed_annotation.dart';
part 'refresh_token_state.freezed.dart';
@freezed
class RefreshTokenState<T> with _$RefreshTokenState {
  const factory RefreshTokenState.initial() = _Initial;
    const factory RefreshTokenState.loading() = Loading;
  const factory RefreshTokenState.success(T data) = Success<T>;
  const factory RefreshTokenState.error({required String error}) = Error;
}
