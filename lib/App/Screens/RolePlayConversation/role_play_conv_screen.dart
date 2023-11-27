import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:chatgpt_role_play/App/Provider/role_play_convo_provider.dart';
import 'package:chatgpt_role_play/App/Services/open_ai_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/message_tile.dart';

class RolePlayConversationScreen extends StatefulWidget {
  const RolePlayConversationScreen({super.key});

  @override
  State<RolePlayConversationScreen> createState() => _RolePlayConversationScreenState();
}

class _RolePlayConversationScreenState extends State<RolePlayConversationScreen> {
  onInit(){
Provider.of<RolePlayConvoProvider>(context, listen: false).initSpeech();
  }

  final OpenAIService openAIService = OpenAIService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onInit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Role Play: Cold Call', style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 69),
        decoration: const BoxDecoration(
          color: const Color(0xffF6F8FB),
        ),
        child: Consumer<RolePlayConvoProvider>(
          builder: (context, rolePlayConvoProvider, child) {
            return Column(
              children: [
                Container(
                  height: 1,
                  color: const Color(0xffE8E8E8),
                ),
              const  SizedBox(
                  height: 17,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 17, top: 25, bottom: 25),
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.height * 0.70,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: ListView.builder(
                            itemCount: openAIService.messages.length,
                            itemBuilder: (context, index){
                        return MessageTile(
                          title: openAIService.messages[index].content.toString(),
                          isUSerSide: openAIService.messages[index].role == 'user'? true : false,
                        );
                          }),
                        ),const SizedBox(
                  height: 21,
                ),
                Text(
                  // If listening is active show the recognized words
                  rolePlayConvoProvider.speechToText.isListening
                      ? '${rolePlayConvoProvider.lastWords}'
                      // If listening isn't active but could be tell the user
                      // how to start it, otherwise indicate that speech
                      // recognition is not yet ready or not supported on
                      // the target device
                      : rolePlayConvoProvider.speechEnabled
                          ? 'Tap the microphone to start listening...'
                          : 'Speech not available',
                ),
              Padding(padding: const EdgeInsets.only(right: 46),
              child:  appButton(horizontalPadding: 36, verticalPadding: 6, color: Theme.of(context).primaryColor, title: rolePlayConvoProvider.speechToText.isNotListening ? 'Start': 'Finish', radius: 5, context: context, titleColor: Theme.of(context).scaffoldBackgroundColor, fontSize: 12, fontWeight: FontWeight.w500, 
              onTap: rolePlayConvoProvider.speechToText.isNotListening ? rolePlayConvoProvider.startListening : rolePlayConvoProvider.stopListening,),),
                      ],
                    )
                  ],
                ),
               
              ],
            );
          }
        ),
      ),
    );
  }
}
