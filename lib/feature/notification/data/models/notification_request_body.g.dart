// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequestModel _$NotificationRequestModelFromJson(
        Map<String, dynamic> json) =>
    NotificationRequestModel(
      message: json['message'] as String,
      forWho: json['for'] as String,
    );

Map<String, dynamic> _$NotificationRequestModelToJson(
        NotificationRequestModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'for': instance.forWho,
    };
