// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_User.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String content;
  final String groupId;
  final String senderId;
  final GetAllUserResponse sender;
  MessageModel({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.content,
    required this.groupId,
    required this.senderId,
    required this.sender,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
