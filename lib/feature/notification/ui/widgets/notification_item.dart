import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/feature/notification/data/models/get_all_notification_response_body.dart';
import 'package:mem_admain/feature/notification/logic/all%20notification%20cubit/all_notification_cubit.dart';
import 'package:mem_admain/feature/notification/ui/widgets/details_of_notification_item.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final GetAllNotificationResponse notification;
  String convertForWho(String forWho) {
    if (forWho == 'All') {
      return 'الجميع';
    } else if (forWho == 'STUTTERER') {
      return 'متعثلمين فقط';
    } else {
      return ' ذوي صلة ';
    }
  }

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
            DetailsOfNotificationItem(
                text1: '  : محتوى الإشعار', text2: notification.message),
            SizedBox(
              height: 10.h,
            ),
            DetailsOfNotificationItem(
              text1: ' : الفئة المستهدفة',
              text2: convertForWho(notification.forWho),
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
                    context
                        .read<AllNotificationCubit>()
                        .deletNotification(notification.id);

                    context.pushNamedAndRemoveUntil(homeScreen);
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
