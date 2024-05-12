import 'dart:io';

import 'package:mem_admain/core/networking/api_error_handler.dart';
import 'package:mem_admain/core/networking/api_result.dart';
import 'package:mem_admain/core/networking/api_services.dart';
import 'package:mem_admain/feature/exercise/data/models/exercise_model.dart';

class ExerciseRepo {
  final ApiService apiService;

  ExerciseRepo(this.apiService);

  Future<ApiResult<List<ExerciseModel>>> getAllExercises(String token) async {
    try {
      final respons = await apiService.getAllExercises(token);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ExerciseModel>> createExercise(String token, String name,
      String description, ExerciseType type, File file) async {
    try {
      final respons = await apiService.createExercise("Bearer $token", name,
          description, type.toString().toUpperCase(), file);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ExerciseModel>> updateExercise(String token, String id,
      String name, String description, ExerciseType type, File file) async {
    try {
      final respons = await apiService.updateExercise(
          token, id, name, description, type.toString().toUpperCase(), file);
      return ApiResult.success(respons);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteExercise(String token, String id) async {
    try {
      await apiService.deletExercise(token, id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
