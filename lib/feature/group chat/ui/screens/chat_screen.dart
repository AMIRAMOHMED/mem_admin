import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/networking/dio_factroy.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/message_repo.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chat_buble.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../../core/networking/api_services.dart';
import '../../data/models/get_all_groups_response.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.meeting});
  final GetAllGroupResponseBody meeting;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageRepo _messageRepo = MessageRepo(ApiService(DioFactory.getDio()));
  final token = SharedPref().getString(PrefKeys.accessToken);
  final userId = SharedPref().getString(PrefKeys.userId);
  IO.Socket? socket;
  final TextEditingController _message = TextEditingController();
  final ScrollController _controller = ScrollController();

  List<MessageModel> messagesList = [];

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

      socket!.on("message", (data) {
        print("Message received: $data");
        final message = data[1];
        final messageModel = MessageModel.fromJson(message);
        setState(() {
          messagesList.add(messageModel);
        });
      });
    } catch (e) {
      print('Error connecting to socket: $e');
    }
  }

  void sendMessage(String messag, String groupID) {
    socket!.emitWithAck("message", [groupID, messag], ack: (data) {});
  }

void _scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 10000),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
        final _controller = ScrollController();


    
    Stream<List<MessageModel>> getMessagesStream() {
     final  response = _messageRepo.getAllMessageRepo(
          "Bearer $token", "${widget.meeting.id}");
      return response as Stream<List<MessageModel>>;
    }



    return Scaffold(
      appBar: AppbarWidget(
        text: " ${widget.meeting.name}",
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messagesList = snapshot.data!;

                return ListView.builder(
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    final message = messagesList[index];
                    return ChatBubble(message: message);
                  },
                );
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
                      print("${widget.meeting.id}");
                      _message.clear();
                      _scrollToBottom();
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
