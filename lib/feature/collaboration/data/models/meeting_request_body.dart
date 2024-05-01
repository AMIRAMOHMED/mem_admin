import 'package:json_annotation/json_annotation.dart';

part 'meeting_request_body.g.dart';

@JsonSerializable()
class MeetingRequestBody {
  String name;
  String url;
  @JsonKey(name: 'for')
  String forWho; 
  List<String> selectedUserIds;
  String dateTime;
  String message;

  MeetingRequestBody({
    required this.name,
    required this.url,
    required this.forWho, // Updated variable name here too
    required this.dateTime,
    required this.message,
    this.selectedUserIds = const [],
  });

  factory MeetingRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MeetingRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingRequestBodyToJson(this);
}
