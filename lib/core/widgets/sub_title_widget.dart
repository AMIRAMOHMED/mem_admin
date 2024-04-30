import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        text,
        style: AppStyles.font20Black(context),
      ),
    );
  }
}
