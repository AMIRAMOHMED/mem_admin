import 'package:flutter/material.dart';
import 'package:mem_admain/core/extension/num_extension.dart';
import 'package:mem_admain/core/theme/app_pallete.dart';

class AppStyles {
  static const String tajawalFontFamily = 'Tajawal';

  static TextStyle font32BoldWhite(BuildContext context) {
    return TextStyle(
        color: AppPallete.white,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        fontFamily: tajawalFontFamily,
        height: 1.6.h);
  }

  static TextStyle font40Black(BuildContext context) {
    return TextStyle(
      color: AppPallete.black,
      fontSize: 40.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
    );
  }

  static TextStyle font13Black(BuildContext context) {
    return TextStyle(
      color: AppPallete.black,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
      height: 1.h,
    );
  }

  static TextStyle font20Black(BuildContext context) {
    return TextStyle(
      color: AppPallete.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
      height: 1.5.h,
    );
  }

  static TextStyle font16LightGray(BuildContext context) {
    return TextStyle(
        color: AppPallete.lightGray,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: tajawalFontFamily,
        height: 1.h);
  }

  static TextStyle font30Black(BuildContext context) {
    return TextStyle(
      color: AppPallete.black,
      fontSize: 30.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
    );
  }

 static TextStyle font16Black(BuildContext context) {
    return TextStyle(
      color: AppPallete.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
    );
  }

  static TextStyle font16Blue(BuildContext context) {
    return TextStyle(
        color: AppPallete.blue,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: tajawalFontFamily,
        height: 1.h);
  }

  static TextStyle font24Blue(BuildContext context) {
    return TextStyle(
        color: AppPallete.blue,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        fontFamily: tajawalFontFamily,
        height: 1.h);
  }

  static TextStyle font30Green(BuildContext context) {
    return TextStyle(
        color: AppPallete.organgeColor,
        fontSize: 30.sp,
        fontWeight: FontWeight.w500,
        fontFamily: tajawalFontFamily,
        height: 1.h);
  }

  static TextStyle font24White(BuildContext context) {
    return TextStyle(
      color: AppPallete.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      fontFamily: tajawalFontFamily,
      height: 1.h,
    );
  }
}
