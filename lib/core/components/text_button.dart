import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';

class DefaultTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? color;
  final Color? textColor;
  const DefaultTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.fontSize = 12.0,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: color),
      child: Text(title,
          style: TextStyle(
            fontFamily: secondaryFont,
            fontWeight: FontWeight.w400,
            color: textColor,
            fontSize: fontSize.sp,
          )),
    );
  }
}
