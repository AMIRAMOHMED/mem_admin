import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';

import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/logic/exercise_cubit.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/video_player_widget.dart';

class ExerciseDetailsItem extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDetailsItem({
    super.key,
    required this.exercise,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 15.0, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        height: 500.h,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppPallete.blue,
        ),
        child: Column(
          children: [
            SubTitleWidget(text: exercise.name),
            SizedBox(
              height: 15.h,
            ),
            VideoPlayerItem(
              videoAssets: exercise.mediaUrl,
              videoPlayerType: VideoPlayerType.network,
            ),
            const SubTitleWidget(text: ":وصف التمرين"),
            Text(
              exercise.description,
              textAlign: TextAlign.right,
              style: AppStyles.font20Black(context),
            ),
            SizedBox(
              height: 15.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30.h,
                  ),
                  color: Colors.red,
                  onPressed: () {
                    context.read<ExerciseCubit>().deleteExercise(exercise.id);
                    context.pushNamedAndRemoveUntil(homeScreen);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
