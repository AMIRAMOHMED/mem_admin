import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';

class MessageRepo {
  final ApiService _apiService;

  MessageRepo(this._apiService);

 Stream <List<MessageModel>> getAllMessageRepo(
      String token, id)  {
  
      final respons =  _apiService.getAllMessage(token, id);
      return respons;
  }









}
