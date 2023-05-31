import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/colors.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  const GradientIcon({super.key,required this.icon,this.size=22});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) {
          return AppColors.kGradient.createShader(rect);
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: size.sp,
        ));
  }
}