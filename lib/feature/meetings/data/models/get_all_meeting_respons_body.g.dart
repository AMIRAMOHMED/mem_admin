// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_meeting_respons_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMeetingResponseBody _$GetAllMeetingResponseBodyFromJson(
        Map<String, dynamic> json) =>
    GetAllMeetingResponseBody(
      json['dateTime'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      forWho: json['for'] as String?,
    );

Map<String, dynamic> _$GetAllMeetingResponseBodyToJson(
        GetAllMeetingResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'for': instance.forWho,
      'dateTime': instance.dateTime,
    };
