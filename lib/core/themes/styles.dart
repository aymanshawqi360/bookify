import 'package:book_rental_app/core/config/app_strings.dart';
import 'package:book_rental_app/core/themes/color_manager.dart';
import 'package:book_rental_app/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle font32BlackSemiBold = TextStyle(
    color: ColorsManager.black,
    fontSize: 32,
    fontFamily: AppStrings.fonFamilyTajawal,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font10DartGrayBold = TextStyle(
    color: ColorsManager.darkGray,
    fontSize: 10,
    fontFamily: AppStrings.fontFamilyAppIcons,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font8DartGrayBold = TextStyle(
    color: ColorsManager.darkGray,
    fontSize: 8,
    fontFamily: AppStrings.fontFamilyAppIcons,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12GrayMedium = TextStyle(
    color: ColorsManager.gray,
    fontSize: 12,
    fontFamily: AppStrings.fonFamilyApple,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle fon13LightGrayBold = TextStyle(
    color: ColorsManager.lightGray,
    fontSize: 15,
    // fontFamily: AppStrings.fonFamilyApple,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle fon14WhiteMedium = TextStyle(
    color: ColorsManager.white,
    fontSize: 14,
    // fontFamily: AppStrings.fonFamilyApple,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle fon12GrayMedium = TextStyle(
    color: ColorsManager.gray,
    fontSize: 12,
    // fontFamily: AppStrings.fonFamilyApple,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle fon12BlueSemiBold = TextStyle(
    color: ColorsManager.blue,
    fontSize: 12,
    // fontFamily: AppStrings.fonFamilyApple,
    fontWeight: FontWeightHelper.semiBold,
  );
}
