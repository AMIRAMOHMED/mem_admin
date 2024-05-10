import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';
import 'package:mem_admain/feature/group%20chat/data/models/get_all_User.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_cubit.dart';
import 'package:mem_admain/feature/group%20chat/logic/All%20Users%20Cubit/all_user_state.dart';

class ChooseUsers extends StatefulWidget {
  const ChooseUsers({super.key});

  @override
  State<ChooseUsers> createState() => _ChooseUsersState();
}

class _ChooseUsersState extends State<ChooseUsers> {
  final List<GetAllUserResponse> _selectedUser = [];

  @override
  void initState() {
    super.initState();
    context.read<AllUserCubit>().getAllUser();
  }

  String getUserTypeLabel(String userType) {
    switch (userType) {
      case 'RELATED':
        return 'ذو صله';
      case 'STUTTERER':
        return 'متعلثم';
      default:
        return userType; 
    }
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
                          text: user.firstName!,
                          style: AppStyles.font20Black(context),
                        ),
                        TextSpan(
                          text: ' (${getUserTypeLabel(user.type!)})',
                          style: AppStyles.font16LightGray(context),
                        ),
                      ],
                    ),
                  ),
                  value: _selectedUser.contains(user),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        _selectedUser.add(user);
                      } else {
                        _selectedUser.remove(user);
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
}
