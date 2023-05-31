import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class CircularButton extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final GestureTapCallback onTap;
  final double? height;
  final double? width;

  const CircularButton({super.key, this.icon, this.child, required this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 35.w,
      height: height ?? 35.h,
      decoration: BoxDecoration(
        gradient: AppColors.sGradient,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(60.r),
          onTap: onTap,
          child: child == null ? Icon(
            icon,
            color: Colors.white,
            size: 25.sp,
          ) : Center(child: child),
        ),
      ),
    );
  }
}
