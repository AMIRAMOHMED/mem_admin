import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/app/cubit/selection_user_cubit.dart';
import 'package:mem_admain/core/app/cubit/selection_user_state.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

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
                Expanded(
                  child: ListTile(
                    title: const Text(
                      "متلعثم",
                      style: TextStyle(fontSize: 13),
                    ),
                    leading: Radio(
                      value: "stuttered",
                      groupValue: state.maybeWhen(
                        success: (option) => option,
                        orElse: () => null,
                      ),
                      onChanged: (value) {
                        context.read<SelectionUserCubit>().pickChoose(context, value.toString());
                      },
                      activeColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text(
                      "ذو صلة",
                      style: TextStyle(fontSize: 13),
                    ),
                    leading: Radio(
                      activeColor: Colors.black,
                      value: "related",
                      groupValue: state.maybeWhen(
                        success: (option) => option,
                        orElse: () => null,
                      ),
                      onChanged: (value) {
                        context.read<SelectionUserCubit>().pickChoose(context, value.toString());
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text(
                      "الكل",
                      style: TextStyle(fontSize: 13),
                    ),
                    leading: Radio(
                      activeColor: Colors.black,
                      value: "all",
                      groupValue: state.maybeWhen(
                        success: (option) => option,
                        orElse: () => null,
                      ),
                      onChanged: (value) {
                        context.read<SelectionUserCubit>().pickChoose(context, value.toString());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
