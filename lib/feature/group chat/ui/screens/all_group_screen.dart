import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/loading_widget.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_groups_response.dart';
import 'package:mem_admain/feature/group%20chat/logic/group%20chat%20cubit/group_chat_cubit.dart';

import 'package:mem_admain/feature/group%20chat/ui/widgets/group_chat_item.dart';

class AllGroupScreen extends StatelessWidget {
  const AllGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("المجموعات"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<GetAllGroupResponseBody>>(
              stream: context.read<GroupChatCubit>().allGroupsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingWidget();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: AppStyles.font40Black(context),
                  );
                } else {
                  final allGroupsList = snapshot.data;
                  if (allGroupsList == null || allGroupsList.isEmpty) {
                    return Center(
                  child: Text('لا يوجد مجموعات',style: AppStyles.font20Black(context),),
                );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: allGroupsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GroupChatItem(
                            allGroups: allGroupsList[index],
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
