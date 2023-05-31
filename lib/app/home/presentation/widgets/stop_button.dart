import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/gradient_icon.dart';
import '../../../../core/styles/colors.dart';

class StopButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  const StopButton({super.key,required this.onPressed,this.title='Stop'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border:
                        Border.all(width: 2.w,color: AppColors.kPurple),
                    gradient: AppColors.tGradient,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: GradientIcon(
                      icon: Icons.rectangle_rounded,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.kPurple),
                ),
              ],
            )));
  }
}
