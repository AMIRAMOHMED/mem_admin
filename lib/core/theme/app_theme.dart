import 'package:flutter/material.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10));

  static final darkTthemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPallete.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.white),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.lightBlueColor),
    ),
    timePickerTheme: _myTimePickerTheme(ThemeData().timePickerTheme),
  );
}

TimePickerThemeData _myTimePickerTheme(
  TimePickerThemeData base,
) {
  return base.copyWith(
    hourMinuteTextColor: AppPallete.black,
    dialBackgroundColor: AppPallete.lightPastelBlue,
    dialHandColor: AppPallete.pastelBlue,
    dialTextColor: AppPallete.black,
    entryModeIconColor: AppPallete.white,
    hourMinuteColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.pressed) ||
          states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused) ||
          states.contains(MaterialState.selected)) {
        return AppPallete.lightPastelBlue;
      }
      return AppPallete.white;
    }),
    dayPeriodTextColor: AppPallete.black,
    dayPeriodColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.pressed) ||
          states.contains(MaterialState.hovered) ||
          states.contains(MaterialState.focused) ||
          states.contains(MaterialState.selected)) {
        return AppPallete.lightPastelBlue;
      }
      return AppPallete.white;
    }),
  );
}
