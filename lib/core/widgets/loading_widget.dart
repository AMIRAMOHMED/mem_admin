import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mem_admain/core/constant/assets.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:50.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
           SizedBox(
           height:400,
           child: Lottie.asset(Assets.loading)
           ),
          
          
        ]),
    );
  }
}