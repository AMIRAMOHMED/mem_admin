import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mem_admain/core/networking/dio_factroy.dart';
import 'package:mem_admain/feature/collaboration/data/repo/creat_meeting_repo.dart';
import 'package:mem_admain/feature/collaboration/data/repo/get_all_meetings_repo.dart';
import 'package:mem_admain/feature/collaboration/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/collaboration/logic/get%20all%20meeting%20cubit/get_all_meeting_cubit.dart';
import 'package:mem_admain/feature/login/data/repository/login_repo.dart';
import 'package:mem_admain/feature/login/data/repository/vaildate_token_repo.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_cubit.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_cubit.dart';
import 'package:mem_admain/feature/notification/data/repo/create_notification_repo.dart';
import 'package:mem_admain/feature/notification/logic/cubit/notfication_cubit.dart';

import '../networking/api_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //check token

  // getIt.registerLazySingleton<VaildateTokenRepo>(
  //     () => VaildateTokenRepo(getIt()));
  // getIt.registerFactory<VaildCubit>(() => VaildCubit(getIt()));

  // getIt.registerFactory<RefreshTokenCubit>(() => RefreshTokenCubit(getIt()));

  //creat meeting
  getIt
      .registerLazySingleton<CreetMeetingRepo>(() => CreetMeetingRepo(getIt()));

  getIt.registerFactory<CreatMeetingCubit>(() => CreatMeetingCubit(getIt()));

  //get all meeting

  getIt.registerLazySingleton<GetAllMeetingsRepo>(
      () => GetAllMeetingsRepo(getIt()));

  getIt.registerFactory<GetAllMeetingCubit>(() => GetAllMeetingCubit(getIt()));

  
  getIt.registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));

  getIt.registerFactory<NotficationCubit>(() => NotficationCubit(getIt()));
}
