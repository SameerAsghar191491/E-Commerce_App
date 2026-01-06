import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/bottomsheet_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/text_feild_theme.dart';
import 'package:e_commerce_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomsheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFeildTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomsheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFeildTheme.lightInputDecorationTheme,
  );
}
