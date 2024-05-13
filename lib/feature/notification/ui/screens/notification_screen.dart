import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/core/widgets/user_selection_box.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/custom_alert_dialog.dart';
import 'package:mem_admain/feature/notification/logic/create%20notification%20cubit/notfication_cubit.dart';

import '../widgets/notification_linster.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

late TextEditingController messageNotification;

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    messageNotification = context.read<NotficationCubit>().messageNotification;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppbarWidget(
          backArrow: true,
          text: 'الاشعارات',
        ),
        body: Center(
          child: Column(
            children: [
              AppTextButton(
                buttonWidth: 200.w,
                buttonHeight: 80.h,
                borderRadius: 40,
                backgroundColor: AppPallete.lightOrange,
                buttonText: " عرض جميع الاشعارات ",
                textStyle: AppStyles.font20Black(context),
                onPressed: () {
                  context.pushReplacementNamed(allNotificationScreen);
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: SubTitleWidget(
                  text: 'انشاء اشعار',
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 450.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppPallete.lightOrange,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        const SubTitleWidget(
                          text: "محتوي الاشعار",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: messageNotification,
                          style: AppStyles.font13Black(context),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppPallete.white,
                            hintStyle: AppStyles.font13Black(context),
                            hintText: 'ادخل محتوي الاشعار',
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const SubTitleWidget(
                          text: "اختيار المستهدف",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const Directionality(
                          textDirection: TextDirection.rtl,
                          child: UserSelectionBox(),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        AppTextButton(
                          buttonText: "أضافة الاشعار",
                          buttonWidth: 100.w,
                          backgroundColor: AppPallete.white,
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          borderRadius: 40,
                          buttonHeight: 50.h,
                          textStyle: AppStyles.font20Black(context),
                          onPressed: () {
                            if (messageNotification.text.isNotEmpty) {
                              context
                                  .read<NotficationCubit>()
                                  .emitCreatNotificationState(context);

                              
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => const CustomAlertDialog(),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const NotificationLinster()
            ],
          ),
        ),
      ),
    );
  }
}
