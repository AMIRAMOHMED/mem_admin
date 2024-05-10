// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creat_group_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatGroupResponseBody _$CreatGroupResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CreatGroupResponseBody(
      createdAt: json['createdAt'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CreatGroupResponseBodyToJson(
        CreatGroupResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'name': instance.name,
    };
