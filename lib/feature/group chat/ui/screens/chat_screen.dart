import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chat_buble.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:uuid/uuid.dart';

import '../../data/models/get_all_groups_response.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.meeting});
  final GetAllGroupResponseBody meeting;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messagesList = [];
  final token = SharedPref().getString(PrefKeys.accessToken);
  final userId = SharedPref().getString(PrefKeys.userId);
  IO.Socket? socket;
  final TextEditingController _message = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    try {
      socket = IO.io(
        'https://mem.hossamohsen.me',
        IO.OptionBuilder()
            .disableAutoConnect()
            .enableForceNewConnection()
            .setTransports(['websocket']).setExtraHeaders({
          "Authorization": "Bearer $token",
        }).build(),
      );

      socket!.onError((error) {
        print('Socket connection error: $error');
      });

      socket!.connect();

        socket!.connect();
 socket!.on("message", (_message) {
      print("Message received: $_message");
      setState(() {
      
      // final message = MessageModel(
      //     createdAt: DateTime.now(), 
      //     updatedAt: DateTime.now(),
      //     id:const Uuid().v4(), 
      //     content: _message.text, 
      //     groupId:"${widget.meeting.id}", 
      //     senderId:"$userId" , 
      //     sender:List <GetAllGroupResponseBody>.empty(), 

      //   );
      //   messagesList.add(message);
      
      });
    });
    } catch (e) {
      print('Error connecting to socket: $e');
    }
  }

void sendMessage(String messag, String groupID) {
    socket!.emitWithAck("message", {messag, groupID, },ack: (data){});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        text: " ${widget.meeting.name}",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ChatBubble();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _message,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '..... اكتب رسالة',
                hintStyle: AppStyles.font16LightGray(context),
                prefix: GestureDetector(
                  onTap: () {
                    if (_message.text.isNotEmpty) {
                      sendMessage(_message.text, "${widget.meeting.id}");
                      print ("${widget.meeting.id}");
                      _message.clear();
                    }
                  },
                  child: Image.asset(Assets.sendIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
