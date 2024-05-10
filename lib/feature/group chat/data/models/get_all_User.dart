// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'get_all_User.g.dart';

@JsonSerializable()
class GetAllUserResponse {
  final String id;

  final String? firstName;

  final String? lastName;

  final String? type;

  final String? profilePictureUrl;

  GetAllUserResponse({
    required this.id,
    this.firstName,
    this.lastName,
    this.type,
    this.profilePictureUrl,
  });

  factory GetAllUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserResponseFromJson(json);
}
