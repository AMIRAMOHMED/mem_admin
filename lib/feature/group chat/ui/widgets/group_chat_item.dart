
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_groups_response.dart';
import 'package:mem_admain/feature/group%20chat/logic/group%20chat%20cubit/group_chat_cubit.dart';

class GroupChatItem extends StatelessWidget {
  const GroupChatItem({
    super.key, required this.allGroups, 
  });

  final GetAllGroupResponseBody allGroups;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: AppPallete.darkPink,
            borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
            " ${allGroups.name}",
              style: AppStyles.font20Black(context),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                size: 30.h,
              ),
              color: Colors.red,
              onPressed: () {
                context
                .read<GroupChatCubit>()
                .deletMeeting('${allGroups.id}');
                context.pushName(allGroupScreen);
                  context
                .read<GroupChatCubit>()
                .allGroupsStream;
              },
            ),
          ),
        ]));
  }
}
