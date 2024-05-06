import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/core/widgets/choose_widget.dart';
import 'package:mem_admain/core/widgets/custom_buttom_sheet.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/notification/logic/cubit/notfication_cubit.dart';

class AddNotificationButtom extends StatefulWidget {
  const AddNotificationButtom({
    super.key,
  });

  @override
  State<AddNotificationButtom> createState() => _AddNotificationButtomState();
}

late TextEditingController messageNotification;

class _AddNotificationButtomState extends State<AddNotificationButtom> {
  @override
  void initState() {
    super.initState();
    messageNotification = context.read<NotficationCubit>().messageNotification;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectionUserCubit(),
      child: AppTextButton(
        buttonText: "أضافة أشعار",
        buttonWidth: 150.w,
        backgroundColor: AppPallete.lightOrange,
        verticalPadding: 0,
        horizontalPadding: 0,
        buttonHeight: 100.h,
        textStyle: AppStyles.font20Black(context),
        onPressed: () {
          CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: Padding(
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
                      const UserSelectionBox(),
                      SizedBox(
                        height: 40.h,
                      ),
                      AppTextButton(
                          buttonText: "أضافة الاشعار",
                          buttonWidth: 100.w,
                          backgroundColor: AppPallete.white,
                          verticalPadding: 0,
                          horizontalPadding: 0,
                          buttonHeight: 50.h,
                          textStyle: AppStyles.font20Black(context),
                          onPressed: () {
                            context
                                .read<NotficationCubit>()
                                .emitCreatNotificationState(
                                  context,
                                );
                          }),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
