import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/feature/exercise/logic/create/create_exercise_cubit.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/video_player_widget.dart';

class PickVideoWidget extends StatelessWidget {
  const PickVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CreateExerciseCubit>();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: cubit.imageFile == null
                ? Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppPallete.borderColor, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "اختر فيديو",
                        style: TextStyle(
                            fontSize: 16, color: AppPallete.borderColor),
                      ),
                    ),
                  )
                : VideoPlayerItem(
                    videoAssets: cubit.imageFile!.path,
                    videoPlayerType: VideoPlayerType.file,
                  ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: AppPallete.lightBlueColor,
            child: InkWell(
              splashColor: AppPallete.blue,
              onTap: () {
                cubit.pickImage(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: AppPallete.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
