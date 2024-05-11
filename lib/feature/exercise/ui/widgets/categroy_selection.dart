import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({
    super.key,
    required this.onSelectionChanged,
  });
  final Function(String) onSelectionChanged;

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  String? currentOption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        color: AppPallete.white,
        height: 180.h,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "تنفس",
                style: AppStyles.font16Black(context),
              ),
              leading: SizedBox(
                width: 50,
                child: Radio(
                  value: "named in api",
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(
                      () {
                        currentOption = value.toString();

                        widget.onSelectionChanged(currentOption!);
                      },
                    );
                  },
                  activeColor: AppPallete.blue,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "3d محاكي",
                style: AppStyles.font16Black(context),
              ),
              leading: SizedBox(
                width: 50,
                child: Radio(
                  activeColor: AppPallete.blue,
                  value: "named in  api",
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                      widget.onSelectionChanged(currentOption!);
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: Text(
                "استرخاء",
                style: AppStyles.font16Black(context),
              ),
              leading: SizedBox(
                width: 50,
                child: Radio(
                  activeColor: AppPallete.blue,
                  value: "name on api",
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                      widget.onSelectionChanged(currentOption!);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
