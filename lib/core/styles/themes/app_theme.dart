import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import '../colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.kPurple,
    scaffoldBackgroundColor: AppColors.kBgColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.kPurple,
      secondary: AppColors.kLightPurple,
    ),
    fontFamily: primaryFont,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: AppColors.kLightPurple),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.kLightPurple),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.kBgColor,
      elevation: 0,
      toolbarHeight: 90.h,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 25.sp,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.kPurple,
        fontSize: 25.sp,
        fontFamily: secondaryFont,
        height: 1.2,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColors.kPurple,
        fontSize: 25.sp,
        fontFamily: secondaryFont,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
