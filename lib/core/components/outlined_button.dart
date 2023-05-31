import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/colors.dart';
import '../utils/assets_manager.dart';

class DefaultBorderButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const DefaultBorderButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          // foregroundColor: kOrange,
          backgroundColor: Colors.white,
          side: BorderSide(width: 1, color: AppColors.kLightPurple),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              IconsAssets.google,
              height: 25.h,
              width: 25.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors.kLightPurple, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
