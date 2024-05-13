import 'package:json_annotation/json_annotation.dart';
part 'get_all_user.g.dart';
@JsonSerializable()
class GetAllUserResponse {
  final String id;

  final String firstName;

  final String lastName;

  final String type;

  final String? profilePictureUrl;

  GetAllUserResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.type,
    this.profilePictureUrl,
  });

  factory GetAllUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserResponseFromJson(json);
}
