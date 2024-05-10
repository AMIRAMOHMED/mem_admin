// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creat_group_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatGroupRequestBody _$CreatGroupRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreatGroupRequestBody(
      name: json['name'] as String,
      selectedUsersIds: (json['selectedUsersIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreatGroupRequestBodyToJson(
        CreatGroupRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'selectedUsersIds': instance.selectedUsersIds,
    };
