import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';

import 'package:mem_admain/core/widgets/app_bar.dart';

import '../widgets/custom_home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: AppbarWidget(
            text: "الصفحه الرئيسه",
            backArrow: false,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomHomeItem(
                text: "التمارين",
                color: AppPallete.lightBlueColor,
                color2: AppPallete.blue,
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomHomeItem(
                color: AppPallete.darkPink,
                color2: AppPallete.lightPink,
                text: "المجموعات",
                onTap: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomHomeItem(
                color2: AppPallete.pastelBlue,
                text: "القوائم",
                color: AppPallete.lightPastelBlue,
                onTap: () {
                  context.pushName(meetingScreen);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomHomeItem(
                color2: AppPallete.lightOrange,
                text: "الاشعارات",
                color: AppPallete.organgeColor,
                onTap: () {
                  context.pushName(notificationScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
