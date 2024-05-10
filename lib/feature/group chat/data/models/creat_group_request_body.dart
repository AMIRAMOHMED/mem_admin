import 'package:json_annotation/json_annotation.dart';

part 'creat_group_request_body.g.dart';

@JsonSerializable()
class CreatGroupRequestBody {
  String name;

  List<String> selectedUserIds;

  CreatGroupRequestBody({
    required this.name,
     required this.selectedUserIds ,
  });

  factory CreatGroupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreatGroupRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreatGroupRequestBodyToJson(this);
}
