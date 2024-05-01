// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingResponseBody _$MeetingResponseBodyFromJson(Map<String, dynamic> json) =>
    MeetingResponseBody(
      id: json['id'] as String,
      message: json['message'] as String,
      forValue: json['forValue'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$MeetingResponseBodyToJson(
        MeetingResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'forValue': instance.forValue,
      'userId': instance.userId,
    };
