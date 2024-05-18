import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/routing/model_route.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_state.dart';

import '../../logic/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'رجاءاً ادخل  جميع البيانات بشكل صحيح',
                  style: AppStyles.font20Black(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
