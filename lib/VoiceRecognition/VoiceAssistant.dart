import 'package:chatgpt_clone/VoiceRecognition/FeatureBox.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../TextBased/constants/Constants.dart';

class VoiceAssistant extends StatefulWidget {
  State<VoiceAssistant> createState() => VoiceAssistantState();
}

class VoiceAssistantState extends State<VoiceAssistant> {
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }
  Future<void> initSpeechToText() async {
    speechEnabled = await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JARVIS"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // In Stack, items that we put first will be at bottom and the last item will be on top
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                        color: Constants.assistantCircleColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: 125,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('assets/images/userImage.png'))),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
               margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 20),
              decoration: BoxDecoration(border: Border.all(color: Constants.borderColor), borderRadius: BorderRadius.circular(20.0).copyWith(topLeft: Radius.zero)),
              child: Text('Good Morning, what task can I do for you?', style: TextStyle(color: Constants.mainFontColor, fontSize: 25, fontFamily: 'Cera-Pro')),
            ),
            Container(
              alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 22, top: 10),
                child: Text('Here are a few features', style: TextStyle(color: Constants.mainFontColor, fontFamily: 'Cera-Pro', fontSize: 20, fontWeight: FontWeight.bold))
            ),
            Column(
              children: [
                FeatureBox(boxColor: Constants.firstSuggestionBoxColor, featureName: 'ChatGPT', featureDesc: 'A smarter way to stay organized and informed with ChatGPT'),
                FeatureBox(boxColor: Constants.secondSuggestionBoxColor, featureName: 'Dall-E', featureDesc: 'Get inspired and stay creative with your personal assistant powered by Dall-E'),
                FeatureBox(boxColor: Constants.thirdSuggestionBoxColor, featureName: 'Smart Voice Assistant', featureDesc: 'Get the best of both worlds with a voice assistant by Dall-E and ChatGPT'),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (await speechToText.hasPermission && speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          backgroundColor: Constants.firstSuggestionBoxColor,
          child: Icon(Icons.mic)),
    );
  }
}
