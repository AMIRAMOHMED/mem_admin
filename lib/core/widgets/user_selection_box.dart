import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/app/cubit/selection_user_state.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class UserSelectionBox extends StatelessWidget {
  const UserSelectionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionUserCubit, SelectionUserState>(

      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            color: AppPallete.white,
            height: 130,
            width: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildRadioListTile(context, state, "stutterer", "متلعثم"),
                buildRadioListTile(context, state, "related", "ذو صلة"),
                buildRadioListTile(context, state, "all", "الكل"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildRadioListTile(BuildContext context, SelectionUserState state,
      String value, String title) {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: AppStyles.font13Black(context),
        ),
        leading: Radio(
          activeColor: AppPallete.black,
          value: value,
          groupValue: state.maybeWhen(
            success: (option) => option,
            orElse: () => null,
          ),
          onChanged: (newValue) {
            context
                .read<SelectionUserCubit>()
                .pickChoose(context, newValue.toString());
          },
        ),
      ),
    );
  }
}
