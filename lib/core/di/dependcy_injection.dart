import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mem_admain/core/networking/dio_factroy.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/get_all_user_repo.dart';
import 'package:mem_admain/feature/group%20chat/data/repo/group_repo.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_cubit.dart';
import 'package:mem_admain/feature/group%20chat/logic/creat%20group%20cubit/creat_group_cubit.dart';
import 'package:mem_admain/feature/meetings/data/repo/creat_meeting_repo.dart';
import 'package:mem_admain/feature/meetings/data/repo/get_all_meetings_repo.dart';
import 'package:mem_admain/feature/meetings/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/meetings/logic/get%20all%20meeting%20cubit/get_all_meeting_cubit.dart';
import 'package:mem_admain/feature/login/data/repository/login_repo.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_cubit.dart';
import 'package:mem_admain/feature/notification/data/repo/all_notification_repo.dart';
import 'package:mem_admain/feature/notification/data/repo/create_notification_repo.dart';
import 'package:mem_admain/feature/notification/logic/all%20notification%20cubit/all_notification_cubit.dart';
import 'package:mem_admain/feature/notification/logic/create%20notification%20cubit/notfication_cubit.dart';

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

  // Create Notification
  getIt
      .registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));

  getIt.registerFactory<NotficationCubit>(() => NotficationCubit(getIt()));

  // Get All Notification
  getIt.registerLazySingleton<AllNotificationRepo>(
      () => AllNotificationRepo(getIt()));

  getIt.registerFactory<AllNotificationCubit>(
      () => AllNotificationCubit(getIt()));

  // get all user
  getIt.registerLazySingleton<GetAllUsersRepo>(() => GetAllUsersRepo(getIt()));

  getIt.registerFactory<AllUserCubit>(() => AllUserCubit(getIt()));

  // 
    getIt.registerLazySingleton<GroupRepo>(() => GroupRepo(getIt()));

  getIt.registerFactory<CreatGroupCubit>(() => CreatGroupCubit(getIt()));
}
