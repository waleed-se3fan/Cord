import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/footer.dart';
import 'widgets/message_bubble.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailsAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              reverse: true,
              itemBuilder: (context, index) => MessageBubble(
                isMe: index.isOdd,
                message: 'Mervat ' * index,
                date: '10:00',
                attachment: '',
                senderName: 'Doaa',
                type: 'text',
              ),
            ),
          ),
          ChatDetailsFooter(),
        ],
      ),
    );
  }
}
