import 'package:flutter/material.dart';

import '../widgets/TextWidget.dart';

class Constants {
  // Assets
  static String imagePath = "assets/images";
  static String botImg = "$imagePath/chat_logo.png";
  static String userImg = "$imagePath/userImage.png";
  static String openAILogo = "$imagePath/openai_logo.jpg";

  static const String fontPath = "assets/fonts";
  static const String audioPath = "assets/sounds";

  //Color
  static const Color mainFontColor = Color.fromRGBO(19, 61, 95, 1);
  static const Color firstSuggestionBoxColor = Color.fromRGBO(165, 231, 244, 1);
  static const Color secondSuggestionBoxColor =  Color.fromRGBO(
      170, 214, 163, 1.0);
  static const Color thirdSuggestionBoxColor = Color.fromRGBO(
      234, 213, 156, 1.0);
  // static const Color thirdSuggestionBoxColor = Color.fromRGBO(162, 238, 239, 1);
  static const Color assistantCircleColor = Color.fromRGBO(209, 243, 249, 1);
  static const Color borderColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static Color scaffoldBackgroundColor = const Color(0xFF343541);
  static Color cardColor = const Color(0xFF444654);

  static List<String> models = [
    'Model1',
    'Model2',
    'Model3',
    'Model4',
    'Model5'
  ];

  static List<DropdownMenuItem<String>>? get getModelsItem {
    List<DropdownMenuItem<String>>? modelsItems =
  List<DropdownMenuItem<String>>.generate(models.length,(index) => DropdownMenuItem(value:models[index],
      child: TextWidget(
          label: models[index],
          fontSize: 15)
  )
  );
}

  // Messsages
  static final chatMessages = [
    {
      "msg": "Hello who are you?",
      "chatIndex": 0,
    },
    {
      "msg":
          "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
      "chatIndex": 1,
    },
    {
      "msg": "What is flutter?",
      "chatIndex": 0,
    },
    {
      "msg":
          "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
      "chatIndex": 1,
    },
    {
      "msg": "Okay thanks",
      "chatIndex": 0,
    },
    {
      "msg":
          "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
      "chatIndex": 1,
    },
  ];
}
