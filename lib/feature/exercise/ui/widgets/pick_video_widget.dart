import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';

class PickVideoWidget extends StatelessWidget {
  const PickVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppPallete.borderColor, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "اختار فيديو",
                    style:
                        TextStyle(fontSize: 16, color: AppPallete.borderColor),
                  ),
                ),
              )),
        ),
        Positioned.fill(
          child: Container(
            color: AppPallete.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            color: AppPallete.lightBlueColor,
            child: InkWell(
              splashColor: AppPallete.blue,
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  color: AppPallete.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
