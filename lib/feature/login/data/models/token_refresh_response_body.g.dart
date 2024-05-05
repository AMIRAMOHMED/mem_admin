// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRefreshResponseBody _$TokenRefreshResponseBodyFromJson(
        Map<String, dynamic> json) =>
    TokenRefreshResponseBody(
      newToken: json['newToken'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      type: json['type'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$TokenRefreshResponseBodyToJson(
        TokenRefreshResponseBody instance) =>
    <String, dynamic>{
      'newToken': instance.newToken,
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'type': instance.type,
      'profilePictureUrl': instance.profilePictureUrl,
    };
