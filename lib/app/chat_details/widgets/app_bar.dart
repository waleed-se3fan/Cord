import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';

class ChatDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 55,
      centerTitle: false,
      titleSpacing: -10,
      elevation: 5.0,
      title: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kPurple,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Alaa',
            style: TextStyle(
              color: AppColors.kBlack,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
