import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/feature/notification/ui/widgets/details_of_notification_item.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(15.h),
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppPallete.mediumOrange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            const DetailsOfNotificationItem(
                text1: '  :محتوي الاشعار', text2: ""),
            SizedBox(
              height: 10.h,
            ),
            const DetailsOfNotificationItem(
              text1: '  :استهداف الاشعار',
              text2: "  hbnbمحتوي الاشعار",
            ),
             Row(
              children: [
                 IconButton(
              icon: Icon(
                Icons.delete,
                size: 30.h,
              ),
              color: Colors.red,
              onPressed: () {
                
                    // .read<GetAllMeetingCubit>()
                    // .deletMeeting('${allMeetings.id}');
                    context.pushReplacementNamed(allNotificationScreen);
              },
            ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
