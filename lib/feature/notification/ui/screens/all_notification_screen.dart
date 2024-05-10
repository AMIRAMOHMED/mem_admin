import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/loading_widget.dart';
import 'package:mem_admain/feature/notification/data/models/get_all_notification_response_body.dart';
import 'package:mem_admain/feature/notification/logic/all%20notification%20cubit/all_notification_cubit.dart';
import 'package:mem_admain/feature/notification/ui/widgets/notification_item.dart';

class AllNotificationScreen extends StatelessWidget {
  const AllNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllNotification = context.read<AllNotificationCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(
          text: 'جميع الاشعارات',
        ),
        body: StreamBuilder<List<GetAllNotificationResponse>>(
          stream: getAllNotification.allNotificationsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                 
                ),
              );
            } else {
              final allNotificationsList = snapshot.data;
              if (allNotificationsList == null || allNotificationsList.isEmpty) {
                return const Center(
                  child: Text('لا يوجد اشعارات'),
                );
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return  NotificationItem(notification: allNotificationsList[index],);
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                        itemCount: allNotificationsList.length,
                      ),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
