import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_cubit.dart';
import 'package:mem_admain/feature/login/logic/vaildation_cubit/cubit/vaild_state.dart';


class SplashBlocListener extends StatelessWidget {
  const SplashBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VaildCubit, VaildState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppPallete.gray,
                ),
              ),
            );
          },
          success: (loginResponse) async {
            context.pop();
            context.pushReplacementNamed(homeScreen);
          },
          error: (error) {
            context.pushReplacementNamed(loginScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}