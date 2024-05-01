import 'package:json_annotation/json_annotation.dart';

part 'meeting_response_body.g.dart';

@JsonSerializable()
class MeetingResponseBody {
  String id;
  String url;
  String dateTime;
  String name;

  MeetingResponseBody(
      {required this.dateTime,
      required this.id,
      required this.url,
      required this.name});

  factory MeetingResponseBody.fromJson(Map<String, dynamic> json) =>
      _$MeetingResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingResponseBodyToJson(this);
}
