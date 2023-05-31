import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/styles/colors.dart';
import 'language_dialog.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(90.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.appName),
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text('Connected',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.kGreen,
                )),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => showLanguageDialog(context: context),
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
