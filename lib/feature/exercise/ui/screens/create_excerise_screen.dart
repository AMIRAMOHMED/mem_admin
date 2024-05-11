import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/categroy_selection.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/pick_video_widget.dart';

class CreatExceriseScreen extends StatefulWidget {
  const CreatExceriseScreen({super.key});

  @override
  State<CreatExceriseScreen> createState() => _CreatExceriseScreenState();
}

class _CreatExceriseScreenState extends State<CreatExceriseScreen> {
  ExerciseType? selectedUserOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          text: ("اضافة تمارين"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: (SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  AppTextButton(
                    buttonWidth: 200.w,
                    buttonHeight: 80.h,
                    borderRadius: 40,
                    backgroundColor: AppPallete.lightBlueColor,
                    buttonText: " عرض جميع التمارين ",
                    textStyle: AppStyles.font20Black(context),
                    onPressed: () {
                      context.pushName(allExerciseScreen);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: SubTitleWidget(
                      text: 'انشاء تمرين',
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: AppPallete.lightBlueColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            const SubTitleWidget(
                              text: "اسم التمرين",
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
                                hintText: 'ادخل اسم التمرين',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const SubTitleWidget(
                              text: " وصف التمرين",
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
                                hintText: 'ادخل وصف التمرين',
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const SubTitleWidget(
                              text: " فئة التمرين",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CategorySelection(
                              onSelectionChanged: (selectedOption) {
                                selectedUserOption = selectedOption;
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const SubTitleWidget(
                              text: " فيديو التمرين",
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                                height: 250.h,
                                width: 300.w,
                                child: const PickVideoWidget()),
                            SizedBox(
                              height: 40.h,
                            ),
                            AppTextButton(
                                buttonText: "أضافة التمرين",
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
        ));
  }
}
