import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_user.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_cubit.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_state.dart';

class ChooseUsers extends StatefulWidget {
  const ChooseUsers({super.key, required this.adminSelected});
    final Function(List<String>) adminSelected;

  @override
  State<ChooseUsers> createState() => _ChooseUsersState();
}

class _ChooseUsersState extends State<ChooseUsers> {
  final List<String> _selectedUserId = [];

  @override
  void initState() {
    super.initState();
    context.read<AllUserCubit>().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllUserCubit, AllUserState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          error: (errorMSG) => Text('Error: $errorMSG'),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (getAllUser) => Container(
            height: 600.h,
            color: AppPallete.white,
            child: ListView.builder(
              itemCount: getAllUser.length,
              itemBuilder: (context, index) {
                final GetAllUserResponse user = getAllUser[index];
                return CheckboxListTile(
                  activeColor: AppPallete.darkPink,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: user.firstName,
                          style: AppStyles.font20Black(context),
                        ),
                        TextSpan(
                          text: ' (${getUserTypeLabel(user.type)})',
                          style: AppStyles.font16LightGray(context),
                        ),
                      ],
                    ),
                  ),
                  value: _selectedUserId.contains(user.id),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _selectedUserId.add(user.id);
                        widget.adminSelected(_selectedUserId);
                      } else {
                        _selectedUserId.remove(user.id);
                      }
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  String getUserTypeLabel(String userType) {
    switch (userType) {
      case 'RELATED':
        return 'ذو صله';
      case 'STUTTERER':
        return 'متلعثم';
      default:
        return userType;
    }
  }
}
