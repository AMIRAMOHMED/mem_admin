import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';

import 'package:mem_admain/feature/collaboration/data/models/get_all_meeting_respons_body.dart';

class MeetingItem extends StatelessWidget {
  const MeetingItem({
    super.key,
    required this.allMeetings,
  });
  final GetAllMeetingResponseBody allMeetings;

  String convertForWho(String forWho) {
    if (forWho == 'All') {
      return 'الجميع';
    } else if (forWho == 'STUTTERER') {
      return 'متعثلمين فقط';
    } else {
      return 'ذوي صله';
    }
  }

  String convertDatetimeStr(String datetimeStr) {
    final dateTimeObj = DateTime.parse(datetimeStr);
    final day = dateTimeObj.day;
    final month = dateTimeObj.month;
    final year = dateTimeObj.year;
    final hour = dateTimeObj.hour;
    final minute = dateTimeObj.minute;
    final amPm = hour < 12 ? 'صباحا' : 'مساءا';
    final hour12 = hour % 12;

    return '$day-$month-$year\n$amPm $hour12:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 300.h,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: AppPallete.lightPastelBlue,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ContentMeetingItem(
            text2: "${allMeetings.name}",
            text1: '  :عنوان الاجتماع',
          ),
          SizedBox(
            height: 15.h,
          ),
          ContentMeetingItem(
            text2: "${allMeetings.url}",
            text1: '   :رابط الاجتماع',
          ),
          SizedBox(
            height: 15.h,
          ),
          ContentMeetingItem(
            text2: convertForWho('${allMeetings.forWho}'),
            text1: '  :المستهدفين',
          ),
          SizedBox(
            height: 15.h,
          ),
          ContentMeetingItem(
            text2: convertDatetimeStr("${allMeetings.dateTime}"),
            text1: '  :الوقت',
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                size: 30.h,
              ),
              color: Colors.red,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class ContentMeetingItem extends StatelessWidget {
  const ContentMeetingItem({
    super.key,
    required this.text2,
    required this.text1,
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
