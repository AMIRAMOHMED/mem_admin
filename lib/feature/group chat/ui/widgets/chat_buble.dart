import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/constant/constants.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/group%20chat/data/models/message%20model/message_model.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
        DateTime updatedAtPlusTwoHours = message.updatedAt.add(const Duration(hours: 3));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          message.sender.profilePictureUrl == null
              ? const CircleAvatar(
                  radius: 20, backgroundImage: AssetImage(Assets.profilePicLogo))
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 30.h,
                  width: 30.w,
                  child: Image.network(
                    message.sender.profilePictureUrl!,
                  ),
                ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${message.sender.firstName} ${message.sender.lastName}",
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  Constants.dateFormat.format(updatedAtPlusTwoHours),
                  style: AppStyles.font13Black(context),
                ),
                SizedBox(height: 5.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppPallete.lightPink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.content,
                        textAlign: TextAlign.right,
                        style: AppStyles.font20Black(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}