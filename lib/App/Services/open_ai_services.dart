import 'dart:convert';

import 'package:chatgpt_role_play/App/Models/chatgpt_prompt_model.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<PromptModel> messages = [];

  String openAiSecretKey = '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';
  Future<String> chatGPTAPI(String prompt) async {
    messages.add(PromptModel(role: 'user', content: prompt));
    print(messages.length);
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiSecretKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      print(res.statusCode);

      if (res.statusCode == 200) {
        print(true);
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add(PromptModel(role: 'assistant', content: content));
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  
}