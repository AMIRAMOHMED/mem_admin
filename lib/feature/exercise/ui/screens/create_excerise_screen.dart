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
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/logic/create/create_exercise_cubit.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/categroy_selection.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/custom_alert_dialog.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/excerise_linster.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/pick_video_widget.dart';

class CreatExceriseScreen extends StatefulWidget {
  const CreatExceriseScreen({super.key});

  @override
  State<CreatExceriseScreen> createState() => _CreatExceriseScreenState();
}

class _CreatExceriseScreenState extends State<CreatExceriseScreen> {
  ExerciseType? selectedUserOption;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          text: ("إضافة تمرين"),
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
                      context.pushReplacementNamed(allExerciseScreen);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: SubTitleWidget(
                      text: 'إنشاء تمرين',
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
                              controller: nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppPallete.white,
                                hintStyle: AppStyles.font13Black(context),
                                hintText: 'أدخل اسم التمرين',
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
                              controller: descriptionController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppPallete.white,
                                hintStyle: AppStyles.font13Black(context),
                                hintText: 'أدخل وصف التمرين',
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
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CategorySelection(
                                onSelectionChanged: (selectedOption) {
                                  selectedUserOption = selectedOption;
                                },
                              ),
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
                                buttonText: "إضافة التمرين",
                                buttonWidth: 100.w,
                                backgroundColor: AppPallete.white,
                                verticalPadding: 0,
                                horizontalPadding: 0,
                                borderRadius: 40,
                                buttonHeight: 50.h,
                                textStyle: AppStyles.font20Black(context),
                                onPressed: () {
                                  final cubit =
                                      context.read<CreateExerciseCubit>();
                                  if (nameController.text.isNotEmpty &&
                                      descriptionController.text.isNotEmpty &&
                                      selectedUserOption != null &&
                                      cubit.imageFile != null) {
                                    cubit.createExercise(
                                        nameController.text,
                                        descriptionController.text,
                                        selectedUserOption!);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const CustomAlertDialog(),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ExceriseLinster()
                ],
              ),
            ),
          )),
        ));
  }
}
