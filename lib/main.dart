import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/bloc.dart';
import 'package:mem_admain/core/di/dependcy_injection.dart';
import 'package:mem_admain/core/routing/app_routing.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/theme/app_theme.dart';
import 'package:mem_admain/firebase_options.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPref().instantiatePreferences();
  await setupGetIt();
  Bloc.observer = AppBlocObserver();

  runApp(const MemAdmain());
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MemAdmain extends StatelessWidget {
  const MemAdmain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTthemeMode,
      navigatorKey: navigator,
      onGenerateRoute: AppRoutes().onGenerateRoute,
    );
  }
}
