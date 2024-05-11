import 'package:flutter/material.dart';

import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/sub_title_widget.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/video_player_widget.dart';

class ExerciseDetailsItem extends StatelessWidget {
  const ExerciseDetailsItem(
      {super.key,
      required this.nameExcreise,
      required this.descraptionExercise,
      required this.videoAssets});
  final String nameExcreise, descraptionExercise, videoAssets;
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
            SubTitleWidget(text: nameExcreise),
            SizedBox(
              height: 15.h,
            ),
            VideoPlayerItem(
              videoAssets: videoAssets,
            ),
            const SubTitleWidget(text: ":وصف التمرين"),
            Text(
              descraptionExercise,
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
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
