import 'package:json_annotation/json_annotation.dart';

part 'get_all_meeting_respons_body.g.dart';



@JsonSerializable()
class GetAllMeetingResponseBody {
  final String? id;
  final String ?name;
  final String ?url;
 @JsonKey(name: 'for')
  String? forWho; 
  final String?
   dateTime;


  GetAllMeetingResponseBody(
    this.dateTime, {
     this.id,
     this.name,
     this.url,
     this.forWho
  });
 

  factory GetAllMeetingResponseBody.fromJson(Map<String, dynamic> json) =>
      _$GetAllMeetingResponseBodyFromJson(json);
}
