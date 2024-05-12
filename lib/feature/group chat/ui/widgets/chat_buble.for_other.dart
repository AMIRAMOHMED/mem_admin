import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/constant/constants.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';

class ChatBubleForOther extends StatelessWidget {
  final MessageModel message;
  const ChatBubleForOther({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${message.sender.firstName} ${message.sender.lastName}",
                  textAlign: TextAlign.right,
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  Constants.dateFormat.format(message.createdAt),
                  textAlign: TextAlign.right,
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppPallete.darkPink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    message.content,
                    textAlign: TextAlign.right,
                    style: AppStyles.font20Black(context),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          const CircleAvatar(
              radius: 20, backgroundImage: AssetImage(Assets.profilePicLogo)),
        ],
      ),
    );
  }
}
