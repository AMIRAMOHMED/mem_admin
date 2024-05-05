import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/di/dependcy_injection.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_cubit.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_state.dart';
import 'package:mem_admain/feature/splah/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VaildCubit>(), 
      child: Scaffold(
        body: BlocListener<VaildCubit, VaildState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                // Show loading indicator
              },
              success: (loginResponse) async {
                // Navigate to home screen on success
                context.pushReplacementNamed(homeScreen);
              },
              error: (error) {
                // Navigate to login screen on error
                context.pushReplacementNamed(loginScreen);
              },
            );
          },
          child: const SplashScreenBody(),
        ),
      ),
    );
  }
@override
  void initState() {
  super.initState();

  final token = SharedPref().getString(PrefKeys.accessToken);
  if (token != null && token.isNotEmpty) {
    BlocProvider.of<VaildCubit>(context).checkValidationToken();
  } else {
    context.pushReplacementNamed(loginScreen);
  }
}

}
