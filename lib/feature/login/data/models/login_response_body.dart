import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';
@JsonSerializable()
class LoginResponseBody {
  String? token;
  String? id;

  String? email;

  String? firstName;
  String? lastName;
  String? username;
  String? type;
  String? profilePictureUrl;
  LoginResponseBody({
    this.token,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.username,
    this.type,
    this.profilePictureUrl,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
