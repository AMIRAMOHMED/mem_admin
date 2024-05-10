import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chosse_users_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(text: "المجموعات"),
      body: (SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AppTextButton(
                buttonWidth: 200.w,
                buttonHeight: 80.h,
                borderRadius: 40,
                backgroundColor: AppPallete.lightPink,
                buttonText: " عرض جميع المجموعات ",
                textStyle: AppStyles.font20Black(context),
                onPressed: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: SubTitleWidget(
                  text: 'انشاء مجموعة',
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 300.w,
                decoration: BoxDecoration(
                  color: AppPallete.lightPink,
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
                          text: "اسم المجموعة",
                        ),
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
                            hintText: 'ادخل اسم المجموعة',
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const SubTitleWidget(
                          text: "اختيار اعضاء المجموعة",
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const ChooseUsers( ),
                        SizedBox(
                          height: 40.h,
                        ),
                        AppTextButton(
                            buttonText: "أضافة المجموعة",
                            buttonWidth: 100.w,
                            backgroundColor: AppPallete.white,
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            borderRadius: 40,
                            buttonHeight: 50.h,
                            textStyle: AppStyles.font20Black(context),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
