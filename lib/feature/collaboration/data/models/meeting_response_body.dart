import 'package:json_annotation/json_annotation.dart';

part 'meeting_response_body.g.dart';
@JsonSerializable()
class MeetingResponseBody {
  String id;
  String message;
  String forValue;
  String userId;

  MeetingResponseBody({
    required this.id,
    required this.message,
    required this.forValue,
    required this.userId,
  });

  factory MeetingResponseBody.fromJson(Map<String, dynamic> json) =>
      _$MeetingResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingResponseBodyToJson(this);
}
