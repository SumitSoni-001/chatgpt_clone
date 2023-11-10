import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/Constants.dart';
import 'TextWidget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: chatIndex == 0 ? Constants.scaffoldBackgroundColor : Constants.cardColor,
          child: Padding (
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(chatIndex==0 ? Constants.userImg : Constants.botImg, height: 30, width: 30),
                SizedBox(width: 8),
                // Text("Message is here")
                Expanded(child: TextWidget(label: msg)),
                chatIndex == 0 ? SizedBox.shrink() : Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.thumb_down_alt_outlined, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
