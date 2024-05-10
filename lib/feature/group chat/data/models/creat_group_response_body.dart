import 'package:json_annotation/json_annotation.dart';

part 'creat_group_response_body.g.dart';
@JsonSerializable()
class CreatGroupResponseBody {
  String id;
  String createdAt;
  String name;


  CreatGroupResponseBody(
      {required this.createdAt,
      required this.id,
      required this.name,


      
      });

  factory CreatGroupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CreatGroupResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CreatGroupResponseBodyToJson(this);
}
