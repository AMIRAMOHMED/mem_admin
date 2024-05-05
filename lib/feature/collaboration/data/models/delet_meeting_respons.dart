import 'package:json_annotation/json_annotation.dart';
part 'delet_meeting_respons.g.dart';
@JsonSerializable()


class DeletMeetingResponsBody{

  final String ?errorCode;
  final String ?error;

  DeletMeetingResponsBody({required this.errorCode, required this.error});

    factory DeletMeetingResponsBody.fromJson(Map<String, dynamic> json) =>
      _$DeletMeetingResponsBodyFromJson(json);
}