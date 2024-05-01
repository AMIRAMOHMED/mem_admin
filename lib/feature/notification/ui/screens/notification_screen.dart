import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';

import '../widgets/add_notification_buttom.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(
          backArrow: true,
          text: 'الاشعارات',
        ),
        body: Column(
          children: [
            const Center(
              child: AddNotificationButtom(),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ListView.separated(
                        itemBuilder: (context, idex) {
                          return const NotificationItem();
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                              height: 5.h,
                            ),
                        itemCount: 4),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
