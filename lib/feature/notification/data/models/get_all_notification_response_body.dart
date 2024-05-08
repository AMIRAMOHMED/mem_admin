import 'package:json_annotation/json_annotation.dart';

part 'get_all_notification_response_body.g.dart';
@JsonSerializable()


class GetAllNotificationResponse {

 final  String id;
  final String message;
  @JsonKey(name: 'for')
 final  String forWho;
  GetAllNotificationResponse({
    required this.id,
    required this.message,
    required this.forWho,
  });
   factory GetAllNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotificationResponseFromJson(json);}

