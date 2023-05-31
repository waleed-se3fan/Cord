import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/navigator.dart';
import '../../../chat_details/view.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: InkWell(
        onTap: () => navigateTo(ChatDetailsView()),
        child: SizedBox(
          height: 50.h,
          child: Row(
            children: [
              Container(
                height: 47.h,
                width: 47.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0fjjYfJWcu4XyiNgEz08cpAqme93TePmnKXCscwJRNnMNyr4kS26iI16FctxRhW3J1Fo&usqp=CAU'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Doaa Hamdy',
                      style: TextStyle(
                        color: AppColors.kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Hello There, How are things ?',
                      style: TextStyle(
                        color: AppColors.kGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      color: AppColors.kPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.kPurple,
                    child: Text(
                      '3',
                      style: TextStyle(color: AppColors.kWhite),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      direction: Axis.horizontal,
      dragStartBehavior: DragStartBehavior.start,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.4,
        children: [
          SizedBox(width: 5),
          Container(
            width: 61.w,
            height: 57.h,
            color: AppColors.kGrey.withOpacity(0.78),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.more_horiz, color: AppColors.kWhite),
                Text('More',
                    style: TextStyle(color: AppColors.kWhite, fontSize: 12)),
              ],
            ),
          ),
          Container(
            width: 61.w,
            height: 57.h,
            color: AppColors.kPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.archive_outlined, color: AppColors.kWhite),
                Text('Archive',
                    style: TextStyle(color: AppColors.kWhite, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
