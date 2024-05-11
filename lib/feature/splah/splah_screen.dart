import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/sharedpre/shared_pref.dart';
import 'package:mem_admain/core/sharedpre/shared_pref_key.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_cubit.dart';
import 'package:mem_admain/feature/splah/splash_bloc_liisnter.dart';
import 'package:mem_admain/feature/splah/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    navigateToNextScreenAfterDelay();
  }

  Future<void> navigateToNextScreenAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    token = await SharedPref().getString(PrefKeys.accessToken);

    if (token == null || token!.isEmpty) {
      context.pushReplacementNamed(loginScreen);
    } else {
      context.read<VaildCubit>().checkValidationToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SplashScreenBody(),
          ),
          SplashBlocListener(),
        ],
      ),
    );
  }
}
