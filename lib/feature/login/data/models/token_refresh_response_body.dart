

import 'package:json_annotation/json_annotation.dart';

part 'token_refresh_response_body.g.dart';
@JsonSerializable()
class TokenRefreshResponseBody {
  String? newToken;
  String? id;

  String? email;

  String? firstName;
  String? lastName;
  String? username;
  String? type;
  String? profilePictureUrl;
  TokenRefreshResponseBody({
    this.newToken,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.type,
    this.profilePictureUrl,
  });

  factory TokenRefreshResponseBody.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshResponseBodyFromJson(json);
}
