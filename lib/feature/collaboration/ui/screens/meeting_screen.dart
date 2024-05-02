import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/choose_widget.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/collaboration/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/collaboration/ui/widgets/hour_pick.dart';

import '../widgets/data_pick.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

late TextEditingController meetingName;
late TextEditingController urlOfMeeting;
String pickedData = "";
TimeOfDay selectedTime = TimeOfDay.now();

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  void initState() {
    super.initState();

    meetingName = context.read<CreatMeetingCubit>().meetingName;
    urlOfMeeting = context.read<CreatMeetingCubit>().urlOfMeeting;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(
          text: 'القوائم',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextButton(
                    buttonHeight: 80.h,
                    borderRadius: 40,
                    backgroundColor: AppPallete.lightPastelBlue,
                    buttonText: " عرض جميع الاجتماعات ",
                    textStyle: AppStyles.font20Black(context),
                    onPressed: () {

                      context.pushReplacementNamed(allMeetingScreen);
                    },
                  ),
                  PickTime(
                    onPickedData: (pickedUserData) {
                      pickedData = pickedUserData;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  PickHourWidget(
                    onPickedHour: (time) {
                      selectedTime = time;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const SubTitleWidget(text: "اسم الاجتماع"),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    style: AppStyles.font13Black(context),
                    textAlign: TextAlign.right,
                    controller: meetingName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppPallete.white,
                      hintStyle: AppStyles.font13Black(context),
                      hintText: 'ادخل اسم  الاجتماع',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const SubTitleWidget(text: "رابط الاجتماع"),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    style: AppStyles.font13Black(context),
                    textAlign: TextAlign.right,
                    controller: urlOfMeeting,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppPallete.white,
                      hintStyle: AppStyles.font13Black(context),
                      hintText: 'ضع رابط الاجتماع',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const SubTitleWidget(text: "اختيار المستهدف"),
                  SizedBox(
                    height: 15.h,
                  ),
                  const UserSelectionBox(),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppTextButton(
                    buttonHeight: 80.h,
                    borderRadius: 40,
                    backgroundColor: AppPallete.lightPastelBlue,
                    buttonText: "ارسال الموعد",
                    textStyle: AppStyles.font20Black(context),
                    onPressed: () {
                      context.read<CreatMeetingCubit>().emitCreatMeetingState(
                          context, pickedData, selectedTime);

                          context.pushReplacementNamed(allMeetingScreen);
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
   @override
void dispose() {
  super.dispose();
  meetingName.dispose();
  urlOfMeeting.dispose();

}
}
