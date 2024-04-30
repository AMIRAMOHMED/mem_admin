import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color, required this.color2});
  final String text;
  final VoidCallback onTap;
  final Color color,color2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: 320.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color, color2],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        child: Center(
          child: Text(
            text,
            style: AppStyles.font30Black(context),
          ),
        ),
      ),
    );
  }
}
