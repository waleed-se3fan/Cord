import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/colors.dart';

class HomeAssistentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  HomeAssistentAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55.h),
      child: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kWhite,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.kBlack,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
