// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponseBody _$NotificationResponseBodyFromJson(
        Map<String, dynamic> json) =>
    NotificationResponseBody(
      id: json['id'] as String,
      message: json['message'] as String,
      forWho: json['for'] as String,
    );

Map<String, dynamic> _$NotificationResponseBodyToJson(
        NotificationResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'for': instance.forWho,
    };
