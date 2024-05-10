import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/di/dependcy_injection.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_cubit.dart';
import 'package:mem_admain/feature/meetings/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/meetings/logic/get%20all%20meeting%20cubit/get_all_meeting_cubit.dart';
import 'package:mem_admain/feature/meetings/ui/screens/all_meeting_screen.dart';
import 'package:mem_admain/feature/meetings/ui/screens/meeting_screen.dart';
import 'package:mem_admain/feature/group%20chat/ui/screens/chat_screen.dart';
import 'package:mem_admain/feature/home/ui/screens/home_screen.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_cubit.dart';
import 'package:mem_admain/feature/login/ui/screen/login_screen.dart';
import 'package:mem_admain/feature/notification/logic/all%20notification%20cubit/all_notification_cubit.dart';
import 'package:mem_admain/feature/notification/logic/create%20notification%20cubit/notfication_cubit.dart';
import 'package:mem_admain/feature/notification/ui/screens/all_notification_screen.dart';
import 'package:mem_admain/feature/notification/ui/screens/notification_screen.dart';
import 'package:mem_admain/feature/splah/splah_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case notificationScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<NotficationCubit>(),
            ),
            BlocProvider(
              create: (context) => SelectionUserCubit(),
            ),
          ], child: const NotificationScreen()),
        );
      case meetingScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CreatMeetingCubit>(),
              ),
              BlocProvider(
                create: (context) => SelectionUserCubit(),
              ),
            ],
            child: const MeetingScreen(),
          ),
        );
      case allMeetingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetAllMeetingCubit>(),
            child: const AllMeetingScreen(),
          ),
        );
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case chatScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AllUserCubit>(),
              ),
            ],
            child: const ChatScreen(),
          ),
        );
      case allNotificationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AllNotificationCubit>(),
            child: const AllNotificationScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
