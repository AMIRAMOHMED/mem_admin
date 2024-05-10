import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chat_buble.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final token = SharedPref().getString(PrefKeys.accessToken);

  IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io('https://mem.hossamohsen.me', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      'Authorization': "Bearer $token"
    });
    print(token);
    socket!.connect();

    socket!.onConnect((_) {
      print("data connected");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        text: 'اسم المجموعة',
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
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: '..... اكتب رسالة',
                hintStyle: AppStyles.font16LightGray(context),
                prefix: GestureDetector(
                  onTap: () {},
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
