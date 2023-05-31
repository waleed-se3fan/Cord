import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../data/models/onboarding_model.dart';

class BoardingItem extends StatelessWidget {
  final BoardingModel model;
  const BoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Expanded(
          child: Image.asset(
            model.image,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                model.body,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: AppColors.kGrey),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
