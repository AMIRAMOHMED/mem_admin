import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/meetings/data/models/get_all_meeting_respons_body.dart';
import 'package:mem_admain/feature/meetings/logic/get%20all%20meeting%20cubit/get_all_meeting_cubit.dart';
import 'package:mem_admain/feature/meetings/ui/widgets/meeting_item.dart';

import '../../../../core/widgets/loading_widget.dart';

class AllMeetingScreen extends StatelessWidget {
  const AllMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllMeetingCubit = context.read<GetAllMeetingCubit>();

    return Scaffold(
      appBar: AppbarWidget(
        text: 'جميع الاجتماعات',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<GetAllMeetingResponseBody>>(
              stream: getAllMeetingCubit.allMeetingsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingWidget();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: AppStyles.font40Black(context),
                  );
                } else {
                  final allMeetingsList = snapshot.data;
                  if (allMeetingsList == null || allMeetingsList.isEmpty) {
                    return Container();
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: allMeetingsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MeetingItem(
                            allMeetings: allMeetingsList[index],
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
