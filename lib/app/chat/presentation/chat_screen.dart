import 'package:cord_2/app/chat/presentation/widgets/chat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/circular_button.dart';
import '../../../core/components/textformfield.dart';
import '../../../core/styles/colors.dart';
import '../../devices/presentation/widgets/devices_appBar.dart';
import 'widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const DefaultTextField(
              inputType: TextInputType.name,
              prefix: Icons.search,
              title: 'Search',
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 19 / 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(width: 12.w),
                CircularButton(
                  child: Text(
                    '10',
                    style: TextStyle(color: AppColors.kWhite),
                  ),
                  height: 25.h,
                  width: 25.w,
                  onTap: () {},
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('New Group'),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) => ChatTile(),
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.kGrey, thickness: 0.1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
