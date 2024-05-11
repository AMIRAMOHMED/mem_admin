import 'package:flutter/material.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/exercise_details_item.dart';

class AllExerciseScreen extends StatelessWidget {
  const AllExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        text: "التمارين",
        backArrow: true,
      ),
      body: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    ));
  }

  static final List<ExerciseDetailsItem> items = [
    const ExerciseDetailsItem(
      nameExcreise: 'اسم التمرين',
      descraptionExercise:
          "يساعد هذا الفيديو المتلعثم على قدرة الكلام بشكل افضل عن طريق تزويد ثقته ب نفسه التحدث افضل  ",
      videoAssets: 'assets/videoTest.mp4',
    ),
    
  ];
}
  