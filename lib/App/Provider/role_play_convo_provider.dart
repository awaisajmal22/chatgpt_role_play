


import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:chatgpt_role_play/App/Models/chatgpt_prompt_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
FlutterTts flutterTts = FlutterTts();
bool _isSpeaking = false;
  Future speakResponse(String responseText) async {

      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);
      await flutterTts.setLanguage("en-US");
      await flutterTts.speak(responseText);
      
      notifyListeners();
    
  }
//   getLastWord(String value){
// _lastWords = value;
//   }
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
   flutterTts.setStartHandler(() {
    print('stop listing');
    stopListening();
   });
   flutterTts.setCompletionHandler(() {
    _lastWords = '';
    print('start Listing');
      startListening();
    });
       
   
  
   
    notifyListeners();
  }

  void startListening() async {
  try {
    
      await speechToText.listen(
        onResult: (result) {
          if (_lastWords != result.recognizedWords) {
            _lastWords = result.recognizedWords;
            _resetIdleTimer(_lastWords);
            print('Recognized Text: $_lastWords');
            notifyListeners();
          }
        },
      );
       
      
    
  } catch (e) {
    print('Error starting listening: $e');
  }
  notifyListeners(); 
  }

  void stopListening() async {
    // _lastWords = '';
    await speechToText.stop();
    print('stop');
    // _resetIdleTimer(); 
    notifyListeners();
  }

  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   _lastWords = result.recognizedWords;
   
  //   _resetIdleTimer(); 
  //   notifyListeners();
  // }

  void _resetIdleTimer(String msg) {
    _idleTimer?.cancel(); 
    _idleTimer = Timer(Duration(seconds: 5), () {
      print(_lastWords);
      if(_lastWords != ''){
      sendMessage(msg);
      }
      //  stopListening();
      // initSpeech();
          // startListening();
        
      
    });
  }
List<PromptModel>? _messagesList =[];
List<PromptModel>? get messagesList => _messagesList;
  void sendMessage(String msg) async {
  //  _messagesList!.add( PromptModel(role: 'user', content:_lastWords ));
   final chatgptData = await openAIService.chatGPTAPI(msg);
    _messagesList!.addAll(chatgptData);
    
speakResponse(_messagesList!.last.content).whenComplete(() => initSpeech());

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