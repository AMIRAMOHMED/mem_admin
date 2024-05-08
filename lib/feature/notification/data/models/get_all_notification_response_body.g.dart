// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notification_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllNotificationResponse _$GetAllNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllNotificationResponse(
      id: json['id'] as String,
      message: json['message'] as String,
      forWho: json['for'] as String,
    );

Map<String, dynamic> _$GetAllNotificationResponseToJson(
        GetAllNotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'for': instance.forWho,
    };
