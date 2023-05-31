import 'package:cord_2/core/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final String? message;
  final String date;
  final String senderName;
  final String? attachment;
  final String type;

  MessageBubble(
      {required this.message,
      required this.isMe,
      required this.date,
      required this.senderName,
      required this.attachment,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !isMe ? Alignment.topLeft : Alignment.topRight,
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: sizeFromWidth(8),
            maxWidth: sizeFromWidth(1.3),
          ),
          child: GestureDetector(
            onTap: () {
              // if (type == 'image') {
              //   ImageView.show(attachment!);
              // }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(10),
              child: Builder(builder: (context) {
                if (type == 'audio') {
                  // return VoiceBubble(
                  //   isMe: isMe,
                  //   url: attachment!,
                  //   key: UniqueKey(),
                  // );
                } else if (type == 'image') {
                  // return InkWell(
                  //   child: Image.network(attachment!),
                  //   onTap: () => ImageView.show(attachment!),
                  // );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text(senderName, style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        type == 'text' ? (message ?? "") : 'مرفق',
                        style: TextStyle(
                          color: isMe
                              ? AppColors.kWhite
                              : AppColors.kBlack.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: sizeFromWidth(8),
                        maxWidth: sizeFromWidth(8),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          date,
                          style: TextStyle(
                            color: isMe
                                ? AppColors.kWhite
                                : AppColors.kBlack.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(isMe ? 8 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 8),
                ),
                color: isMe ? Color(0xFFCFD2F5) : AppColors.kLightGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
