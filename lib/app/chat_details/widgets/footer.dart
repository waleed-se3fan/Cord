import 'package:flutter/material.dart';

import '../../../core/components/circular_button.dart';
import '../../../core/styles/colors.dart';

class ChatDetailsFooter extends StatelessWidget {
  const ChatDetailsFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              cursorHeight: 15,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                fillColor: AppColors.kWhite,
                filled: true,
                hintText: 'Write Something',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                constraints: BoxConstraints(
                  minHeight: 35,
                  maxHeight: 35,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.kWhite,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(24)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kWhite,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          CircularButton(
            onTap: () {},
            child: Icon(
              Icons.send,
              size: 17,
              color: AppColors.kWhite,
            ),
            height: 34,
            width: 34,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.kLightGrey,
        borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
      ),
    );
  }
}
