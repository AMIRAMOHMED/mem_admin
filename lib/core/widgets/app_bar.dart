import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/context_extension.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppbarWidget({
    super.key,
    required this.text,
    this.backArrow = true,
  });

  @override
  final Size preferredSize = Size.fromHeight(120.h);
  final String text;
  final bool backArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      toolbarHeight: 120.h,
      scrolledUnderElevation: 0.0,
      leading: backArrow
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: AppPallete.black,
            )
          : const SizedBox.shrink(),
      title: Text(
        text,
        style: AppStyles.font20Black(context),
      ),
      centerTitle: true,
    );
  }
}
