import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/widgets/app_text_button.dart';
import 'package:mem_admain/feature/login/logic/login_cubit/login_cubit.dart';
import 'package:mem_admain/feature/login/ui/screen/login_bloc_listner.dart';

import '../../../../core/theme/app_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late TextEditingController passwordController;
late TextEditingController emailController;

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = true;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    "مرحباً بك",
                    style: AppStyles.font40Black(context),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintStyle: AppStyles.font16LightGray(context),
                      hintText: 'البريد الإلكتروني ',
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    style: const TextStyle(color: AppPallete.black),
                    textAlign: TextAlign.right,
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      hintStyle: AppStyles.font16LightGray(context),
                      hintText: 'كلمة السر ',
                      prefixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: Icon(
                          isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppPallete.lightGray,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  AppTextButton(
                    backgroundColor: AppPallete.borderColor,
                    buttonText: 'تسجيل الدخول',
                    onPressed: () {
                      context.read<LoginCubit>().emitLoginState();
                    },
                    buttonHeight: 70.h,
                    textStyle: AppStyles.font24Blue(context),
                  ),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}
