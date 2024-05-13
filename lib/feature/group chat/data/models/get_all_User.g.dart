// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserResponse _$GetAllUserResponseFromJson(Map<String, dynamic> json) =>
    GetAllUserResponse(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      type: json['type'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );

Map<String, dynamic> _$GetAllUserResponseToJson(GetAllUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'type': instance.type,
      'profilePictureUrl': instance.profilePictureUrl,
    };
