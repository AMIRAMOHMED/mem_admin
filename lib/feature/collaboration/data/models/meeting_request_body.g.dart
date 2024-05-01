// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingRequestBody _$MeetingRequestBodyFromJson(Map<String, dynamic> json) =>
    MeetingRequestBody(
      name: json['name'] as String,
      url: json['url'] as String,
      forWho: json['for'] as String,
      dateTime: json['dateTime'] as String,
      message: json['message'] as String,
      selectedUserIds: (json['selectedUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MeetingRequestBodyToJson(MeetingRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'for': instance.forWho,
      'selectedUserIds': instance.selectedUserIds,
      'dateTime': instance.dateTime,
      'message': instance.message,
    };
