import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/colors.dart';

class HomeWithout_devices_AppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeWithout_devices_AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55.h),
      child: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.kWhite,
        title: Text(
          'Speak Now',
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
