import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/Constants.dart';
import '../services/ModelService.dart';
import '../widgets/ChatWidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = true;
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Constants.openAILogo),
        ),
        title: const Text("Champak"),
        actions: [
          IconButton(
              onPressed: () async {
                await ModelService.showModalSheet(context: context);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: Constants.chatMessages.length,
            itemBuilder: (context, index) {
              return ChatWidget(
                msg: Constants.chatMessages[index]["msg"].toString(),
                chatIndex: int.parse(
                    Constants.chatMessages[index]["chatIndex"].toString()),
              );
            },
          )),
          if (isTyping) ...[
            SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            SizedBox(height: 20),
            Material(
              color: Constants.cardColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        focusNode: focusNode,
                        controller: textEditingController,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter your message here...",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            )
          ]
        ],
      )),
    );
  }

  void sendMessage() {
    return;
  }
}
