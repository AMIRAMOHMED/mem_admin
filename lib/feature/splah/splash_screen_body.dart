
import 'package:flutter/material.dart';
import 'package:mem_admain/core/constant/assets.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:lottie/lottie.dart';


class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.splahBackGround,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 200.h,
            ),
          ),
          Expanded(
              flex: 1,
              child: LottieBuilder.asset(
                Assets.memLogo,
                width: double.infinity,
              )),
          Expanded(
            flex: 1,
            child: Stack(children: [
              Image.asset(Assets.splashVector),
              Positioned(
                right: 90.w,
                top: 80.h,
                child: Text(
                  textAlign: TextAlign.center,
                  "اهلا بك \nفي مجتمع ميم",
                  style: AppStyles.font32BoldWhite(context),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  
}
