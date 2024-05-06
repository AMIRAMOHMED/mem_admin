
import 'package:json_annotation/json_annotation.dart';
part 'notification_request_body.g.dart';
@JsonSerializable()
class NotificationRequestModel {
final String message;
@JsonKey(name: 'for')
final String forWho;
  NotificationRequestModel({
    required this.message,
    required this.forWho,
  });
    Map<String, dynamic> toJson() => _$NotificationRequestModelToJson(this); 

}
