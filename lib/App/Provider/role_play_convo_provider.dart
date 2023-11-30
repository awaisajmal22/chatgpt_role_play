


import 'dart:async';
import 'dart:typed_data';

import 'package:chatgpt_role_play/App/Models/chatgpt_prompt_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Services/open_ai_services.dart';

class RolePlayConvoProvider extends ChangeNotifier{
  final OpenAIService openAIService = OpenAIService();
  final scrollController = ScrollController();
  SpeechToText speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  String _lastWords = '';
  String get lastWord => _lastWords;
  getLastWord(String value){
_lastWords = value;
  }
  Timer? _idleTimer;

  bool get speechEnabled => _speechEnabled;
  bool get isListening => _isListening;
void scrollDOwn() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
  void isSpeechEnabled({required bool check}) {
    _speechEnabled = check;
    notifyListeners();
  }

  void initSpeech() async {
    _speechEnabled = await speechToText.initialize();
    startListening();
    notifyListeners();
  }

  void startListening() async {
    try {
      await speechToText.listen(
        onResult: _onSpeechResult,
        // listenFor: Duration(seconds: 2), 
      );
    } catch (e) {
      print('Error starting listening: $e');
    }
  }

  void stopListening() async {
    await speechToText.stop();
    print('stop');
    _resetIdleTimer(); 
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;
   
    _resetIdleTimer(); 
    notifyListeners();
  }

  void _resetIdleTimer() {
    _idleTimer?.cancel(); 
    _idleTimer = Timer(Duration(seconds: 5), () {
      print(_lastWords);
      if(_lastWords != ''){
      sendMessage(_lastWords);
      }
       stopListening();
       _lastWords = '';
        Future.delayed(Duration(seconds: 2), () {
          startListening();
        });
      
    });
  }
List<PromptModel>? _messagesList =[];
List<PromptModel>? get messagesList => _messagesList;
  void sendMessage(String msg) async {
  //  _messagesList!.add( PromptModel(role: 'user', content:_lastWords ));
   final chatgptData = await openAIService.chatGPTAPI(msg);
    _messagesList!.addAll(chatgptData);
    scrollDOwn();
    print(_messagesList!.length);
    notifyListeners();
  }

  @override
  void dispose() {
    // speechToText.cancel();
    _idleTimer?.cancel();
    super.dispose();
  }
  int currentPage = 0;
  bool isReady = false;
  Uint8List? pdfPath;
Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
       Uint8List bytes = result.files.first.bytes!;
     
        pdfPath = bytes;
        isReady = true;
        notifyListeners();
    }
    
  }

}