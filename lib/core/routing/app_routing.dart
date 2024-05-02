import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/di/dependcy_injection.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/feature/collaboration/logic/creat%20meeting%20cubit/creat_meeting_cubit.dart';
import 'package:mem_admain/feature/collaboration/logic/get%20all%20meeting%20cubit/get_all_meeting_cubit.dart';
import 'package:mem_admain/feature/collaboration/ui/screens/all_meeting_screen.dart';
import 'package:mem_admain/feature/collaboration/ui/screens/meeting_screen.dart';
import 'package:mem_admain/feature/home/ui/screens/home_screen.dart';
import 'package:mem_admain/feature/login/logic/cubit/login_cubit.dart';
import 'package:mem_admain/feature/login/ui/screen/login_screen.dart';
import 'package:mem_admain/feature/notification/ui/screens/notification_screen.dart';

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
          builder: (_) => const NotificationScreen(),
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
      // case exerciseScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ExerciseScreen(),
      //   );
      // case informationGroupScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const InformationGroupScreen(),

      //   );

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
