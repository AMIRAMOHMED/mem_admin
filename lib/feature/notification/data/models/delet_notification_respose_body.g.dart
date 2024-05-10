// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delet_notification_respose_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletNotificationResponsBody _$DeletNotificationResponsBodyFromJson(
        Map<String, dynamic> json) =>
    DeletNotificationResponsBody(
      json['message'] as String,
      errorCode: json['errorCode'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$DeletNotificationResponsBodyToJson(
        DeletNotificationResponsBody instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'error': instance.error,
      'message': instance.message,
    };
