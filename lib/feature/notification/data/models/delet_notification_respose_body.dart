import 'package:json_annotation/json_annotation.dart';
part 'delet_notification_respose_body.g.dart';
@JsonSerializable()


class DeletNotificationResponsBody{

  final String ?errorCode;
  final String ?error;
  final String message;

  DeletNotificationResponsBody(this.message, {required this.errorCode, required this.error});

    factory DeletNotificationResponsBody.fromJson(Map<String, dynamic> json) =>
      _$DeletNotificationResponsBodyFromJson(json);
}