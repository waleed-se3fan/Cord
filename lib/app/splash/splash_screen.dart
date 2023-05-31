import 'dart:async';

import 'package:cord_2/app/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/navigator.dart';
import '../../core/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        navigateAndFinish(context, const OnBoardingScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColors.kBgColor,
      child: Center(
          child: Image.asset(
        ImgAssets.logo,
        height: 200.h,
        width: 200.w,
      )),
    );
  }
}
