import 'package:flutter/cupertino.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class DetailsOfNotificationItem extends StatelessWidget {
  const DetailsOfNotificationItem({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            text2,
            style: AppStyles.font13Black(context),
          ),
        ),
        Text(
          text1,
          style: AppStyles.font20Black(context),
        ),
      ],
    );
  }
}
