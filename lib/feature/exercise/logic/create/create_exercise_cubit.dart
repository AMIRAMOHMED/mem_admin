import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';
import 'package:mem_admain/feature/exercise/data/repo/exercise_repo.dart';
import 'package:mem_admain/feature/exercise/logic/create/create_exercise_states.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateExerciseCubit extends Cubit<CreateExerciseStates> {
  CreateExerciseCubit(this._exerciseRepo)
      : super(const CreateExerciseStates.initial());

  final ExerciseRepo _exerciseRepo;

  File? imageFile;

  Future<void> pickImage(BuildContext context) async {
    final status = await Permission.videos.request();
    if (status.isGranted) {
      final image = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (image != null) {
        imageFile = File(image.path);
        emit(CreateExerciseStates.imagePicked(File(image.path)));
      } else {
        // User canceled image picking
        emit(const CreateExerciseStates.initial());
      }
    } else if (status.isPermanentlyDenied) {
      // ignore: use_build_context_synchronously
      _showAlertPermissionsDialog(context);
    }
  }

  Future<void> createExercise(
      String name, String description, ExerciseType type) async {
    final token = SharedPref().getString(PrefKeys.accessToken);
    emit(const CreateExerciseStates.loading());
    final result = await _exerciseRepo.createExercise(
        token!, name, description, type, imageFile!);
    result.when(
      success: (_) async {
        emit(CreateExerciseStates.success(result));
      },
      failure: (error) {
        emit(CreateExerciseStates.error(error: error.toString()));
      },
    );
  }

  Future<void> _showAlertPermissionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const TextButton(
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}
