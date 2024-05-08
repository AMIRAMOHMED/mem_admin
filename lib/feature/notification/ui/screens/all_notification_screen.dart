import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/notification/ui/widgets/notification_item.dart';

class AllNotificationScreen extends StatelessWidget {
  const AllNotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(
          text: 'جميع الاشعارات',
        ),
        body: CustomScrollView(
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
            ),
          ],
        ),
      ),
    );
  }
}
