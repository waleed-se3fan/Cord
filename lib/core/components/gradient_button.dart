import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onPressed;
  final double? height;
  final double? width;
  final double fontSize;

  const GradientButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 35.h,
      decoration: BoxDecoration(
        gradient: AppColors.kGradient,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
