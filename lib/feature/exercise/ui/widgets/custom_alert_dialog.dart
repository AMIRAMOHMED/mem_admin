import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '  رجاءاً ادخل جميع البيانات بشكل صحيح',
        style: AppStyles.font20Black(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
