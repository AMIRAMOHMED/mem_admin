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
import 'package:mem_admain/feature/exercise/ui/widgets/custom_alert_dialog.dart';
import 'package:mem_admain/feature/group%20chat/logic/creat%20group%20cubit/creat_group_cubit.dart';
import 'package:mem_admain/feature/group%20chat/ui/widgets/chosse_users_widget.dart';

class CreateGroupChatScreen extends StatefulWidget {
  const CreateGroupChatScreen({super.key});

  @override
  State<CreateGroupChatScreen> createState() => _CreateGroupChatScreenState();
}

late TextEditingController groupName;
List<String> selecteddUserIdd = [];

class _CreateGroupChatScreenState extends State<CreateGroupChatScreen> {
  @override
  void initState() {
    super.initState();
    groupName = context.read<CreatGroupCubit>().groupName;
  }

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
                onPressed: () {
                  context.pushReplacementNamed(allGroupScreen);
                },
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
                          controller: groupName,
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
                        ChooseUsers(
                          adminSelected: (selecteddUserId) {
                            selecteddUserIdd = selecteddUserId;
                          },
                        ),
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
                            onPressed: () {
                              if (selecteddUserIdd.isNotEmpty &&
                                  groupName.text.isNotEmpty) {
                                context
                                    .read<CreatGroupCubit>()
                                    .emitCreatGroupState(selecteddUserIdd);
                                context.pushReplacementNamed(allGroupScreen);
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
            ],
          ),
        ),
      )),
    );
  }
}
