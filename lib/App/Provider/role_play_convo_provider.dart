


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Services/open_ai_services.dart';

class RolePlayConvoProvider extends ChangeNotifier{
  final OpenAIService openAIService = OpenAIService();
  
  SpeechToText speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  String lastWords = '';
  Timer? _idleTimer;

  bool get speechEnabled => _speechEnabled;
  bool get isListening => _isListening;

  void isSpeechEnabled({required bool check}) {
    _speechEnabled = check;
    notifyListeners();
  }

  void initSpeech() async {
    _speechEnabled = await speechToText.initialize();
    notifyListeners();
  }

  void startListening() async {
    try {
      await speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: Duration(seconds: 5), 
      );
    } catch (e) {
      print('Error starting listening: $e');
    }
  }

  void stopListening() async {
    await speechToText.stop();
    _resetIdleTimer(); 
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
   
    _resetIdleTimer(); 
    notifyListeners();
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel(); 
    _idleTimer = Timer(Duration(seconds: 5), () {
      print(lastWords);
      if(lastWords != ''){
      _sendMessage();
      }
       stopListening();
       lastWords = '';
        Future.delayed(Duration(seconds: 2), () {
          startListening();
        });
      
    });
  }

  void _sendMessage() async {
    await openAIService.chatGPTAPI(lastWords);
    
  }

  @override
  void dispose() {
    // speechToText.cancel();
    _idleTimer?.cancel();
    super.dispose();
  }
}