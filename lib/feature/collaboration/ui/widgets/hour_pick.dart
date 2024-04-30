import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';
import 'package:mem_admain/core/theme/app_style.dart';

class PickHourWidget extends StatefulWidget {
  const PickHourWidget({Key? key}) : super(key: key);

  @override
  State<PickHourWidget> createState() => _PickHourWidgetState();
}

class _PickHourWidgetState extends State<PickHourWidget> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 360,
      

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.lightPastelBlue,
          elevation: 0.0,
        ),
        onPressed: () async {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: selectedTime,
            initialEntryMode: TimePickerEntryMode.dial,
          );

          if (pickedTime != null) {
            setState(() {
              selectedTime = pickedTime;
            });
          }
        },
        child: Text(
          textAlign: TextAlign.center,
          selectedTime == TimeOfDay.now()
              ? "حدد الساعة"
              : "تم تحديد الوقت  \n${selectedTime.format(context)}",
          style: selectedTime == TimeOfDay.now()
              ? AppStyles.font20Black(context)
              : AppStyles.font20Black(context),
        ),
      ),
    );
  }
}
