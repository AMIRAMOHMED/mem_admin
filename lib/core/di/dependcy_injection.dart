import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mem_admain/core/networking/dio_factroy.dart';
import 'package:mem_admain/feature/collaboration/data/repo/creat_meeting_repo.dart';
import 'package:mem_admain/feature/collaboration/logic/cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/login/data/repository/login_repo.dart';
import 'package:mem_admain/feature/login/logic/cubit/login_cubit.dart';

import '../networking/api_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //creat meeting
  getIt.registerLazySingleton<CreetMeetingRepo>(() => CreetMeetingRepo(getIt()));
  getIt.registerFactory<CreatMeetingCubit>(() => CreatMeetingCubit(getIt()));



}
