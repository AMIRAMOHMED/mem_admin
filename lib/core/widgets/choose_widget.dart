import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class UserSelectionBox extends StatefulWidget {
  const UserSelectionBox({
    super.key,
    required this.onSelectionChanged,
  });
  final Function(String) onSelectionChanged;

  @override
  State<UserSelectionBox> createState() => _UserSelectionBoxState();
}

class _UserSelectionBoxState extends State<UserSelectionBox> {
  String? currentOption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        color: AppPallete.white,
        height: 130.h,
        width: 160.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  "متلعثم",
                  style: AppStyles.font13Black(context),
                ),
                leading: Radio(
                  value: "stutterer",
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(
                      () {
                        currentOption = value.toString();

                        widget.onSelectionChanged(currentOption!);
                      },
                    );
                  },
                  activeColor: AppPallete.black,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "ذو صلة",
                  style: AppStyles.font13Black(context),
                ),
                leading: Radio(
                  activeColor: AppPallete.black,
                  value: "related",
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
            Expanded(
              child: ListTile(
                title: Text(
                  "الكل",
                  style: AppStyles.font13Black(context),
                ),
                leading: Radio(
                  activeColor: AppPallete.black,
                  value: "all",
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(
                      () {
                        currentOption = value.toString();
                        widget.onSelectionChanged(currentOption!);
                      },
                    );
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
