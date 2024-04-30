import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        context: context,
        backgroundColor: AppPallete.lightOrange,
        isScrollControlled: true,
        barrierColor: AppPallete.transparentColor,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: widget,
              ),
            ),
          );
        },
      ).whenComplete(whenComplete ?? () {});
}
