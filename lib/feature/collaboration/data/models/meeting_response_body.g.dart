// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingResponseBody _$MeetingResponseBodyFromJson(Map<String, dynamic> json) =>
    MeetingResponseBody(
      dateTime: json['dateTime'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
      forWho: json['for'] as String,
    );

Map<String, dynamic> _$MeetingResponseBodyToJson(
        MeetingResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'dateTime': instance.dateTime,
      'name': instance.name,
      'for': instance.forWho,
    };
