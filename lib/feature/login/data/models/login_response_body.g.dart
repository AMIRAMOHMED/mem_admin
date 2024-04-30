// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      token: json['token'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      type: json['type'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'type': instance.type,
      'profilePictureUrl': instance.profilePictureUrl,
    };
