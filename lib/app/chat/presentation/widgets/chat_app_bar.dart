import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../contacts/view.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55.h),
      child: AppBar(
        backgroundColor: AppColors.kWhite,
        title: Text(
          'Chat',
          style: TextStyle(
            color: AppColors.kBlack,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => ContactsView.show,
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/icons/gradient_circle.png'),
                Icon(Icons.add, color: AppColors.kWhite, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
