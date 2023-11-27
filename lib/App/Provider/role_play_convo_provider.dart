


import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Services/open_ai_services.dart';

class RolePlayConvoProvider extends ChangeNotifier{
  final OpenAIService openAIService = OpenAIService();
  SpeechToText speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool get speechEnabled => _speechEnabled;
  String lastWords = '';
  isSpeechEnabled({required bool check}){
_speechEnabled = check;
notifyListeners();
  }

  void initSpeech() async{
    _speechEnabled = await speechToText.initialize();
    
    notifyListeners();
  }
  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    notifyListeners();
  }
  void stopListening() async { 
    await openAIService.chatGPTAPI(lastWords);

    await speechToText.stop();
   
    
    notifyListeners();
  }
  void _onSpeechResult(SpeechRecognitionResult result) {
  
      lastWords = result.recognizedWords;
notifyListeners();
  }
}