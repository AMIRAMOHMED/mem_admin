import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/meetings/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/meetings/logic/creat%20meeting%20cubit/creat_meeting_state.dart';

class MeetingLinster extends StatelessWidget {
  const MeetingLinster({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatMeetingCubit, CreatMeetingState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppPallete.gray,
                ),
              ),
            );
          },
          success: (loginResponse) async {
            context.pop();
            context.pushReplacementNamed(allMeetingScreen);
          },
          error: (error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'برجاء ادخال جميع البيانات بشكل صحيح',
                  style: AppStyles.font20Black(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
