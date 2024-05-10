import 'package:json_annotation/json_annotation.dart';
part 'delet_group_response_body.g.dart';
@JsonSerializable()


class DeletGroupResponse{

  final String ?errorCode;
  final String ?error;

  DeletGroupResponse({required this.errorCode, required this.error});

    factory DeletGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletGroupResponseFromJson(json);
}