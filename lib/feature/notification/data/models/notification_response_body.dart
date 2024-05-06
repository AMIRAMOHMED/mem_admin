import 'package:json_annotation/json_annotation.dart';

part 'notification_response_body.g.dart';

@JsonSerializable()
class NotificationResponseBody {
  final String id;
  final String message;
  @JsonKey(name: 'for')
  final String  forWho; // Note the typo in the variable name

  NotificationResponseBody({
    required this.id,
    required this.message,
    required this.forWho, // Corrected variable name
  });

 factory NotificationResponseBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseBodyFromJson(json);}