import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppbarWidget(text: 'اسم المجموعة',
        
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
                  child: Image.asset(
             Assets.sendIcon
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 