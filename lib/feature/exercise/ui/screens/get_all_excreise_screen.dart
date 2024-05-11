import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/core/widgets/app_bar.dart';
import 'package:mem_admain/core/widgets/loading_widget.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/logic/exercise_cubit.dart';
import 'package:mem_admain/feature/exercise/ui/widgets/exercise_details_item.dart';

class AllExerciseScreen extends StatelessWidget {
  const AllExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExerciseCubit>();

    return Scaffold(
      appBar: AppbarWidget(
        text: "التمارين",
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<ExerciseModel>>(
              stream: cubit.allExercisesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingWidget();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error}',
                    style: AppStyles.font40Black(context),
                  );
                } else {
                  final list = snapshot.data;
                  if (list == null || list.isEmpty) {
                    return Center(
                      child: Text(
                        'لا يوجد تمارين',
                        style: AppStyles.font20Black(context),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExerciseDetailsItem(
                            exercise: list[index],
                          ),
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
