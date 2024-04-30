import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/choose_widget.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/collaboration/ui/widgets/hour_pick.dart';

import '../widgets/data_pick.dart';

class CollaborationScreen extends StatelessWidget {
  const CollaborationScreen({super.key});

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
                  const PickTime(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const PickHourWidget(),
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
                  UserSelectionBox(
                    onSelectionChanged: (String) {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppTextButton(
                    buttonHeight: 80.h,
                    borderRadius: 40,
                    backgroundColor: AppPallete.lightPastelBlue,
                    buttonText: "ارسال الموعد",
                    textStyle: AppStyles.font20Black(context),
                    onPressed: () {},
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
}
