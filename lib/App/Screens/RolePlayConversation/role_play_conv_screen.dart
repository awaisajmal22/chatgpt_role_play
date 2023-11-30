import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:chatgpt_role_play/App/Provider/role_play_convo_provider.dart';
import 'package:chatgpt_role_play/App/Services/open_ai_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'component/message_tile.dart';

class RolePlayConversationScreen extends StatefulWidget {
  const RolePlayConversationScreen({super.key});

  @override
  State<RolePlayConversationScreen> createState() => _RolePlayConversationScreenState();
}

class _RolePlayConversationScreenState extends State<RolePlayConversationScreen> {
  onInit(){
Provider.of<RolePlayConvoProvider>(context, listen: false).initSpeech();
final provider = Provider.of<RolePlayConvoProvider>(context, listen: false);
// if(provider.speechToText.isNotListening){
//   provider.startListening();
//   print('Start listing');
// }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            controller: rolePlayConvoProvider.scrollController,
                            itemCount: rolePlayConvoProvider.messagesList!.length,
                            itemBuilder: (context, index){
                        return  MessageTile(
                          title: rolePlayConvoProvider.messagesList![index].content.toString(),
                          isUSerSide: rolePlayConvoProvider.messagesList![index].role == 'user'? true : false,
                        );
                          }),
                        ),const SizedBox(
                  height: 21,
                ),
              
              Padding(padding: const EdgeInsets.only(right: 46),
              child:  appButton(horizontalPadding: 36, verticalPadding: 6, color: Theme.of(context).primaryColor, title:  'Finish', radius: 5, context: context, titleColor: Theme.of(context).scaffoldBackgroundColor, fontSize: 12, fontWeight: FontWeight.w500, 
              onTap:  rolePlayConvoProvider.stopListening ,),),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                     rolePlayConvoProvider.isReady
          ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.height * 0.78,
            child: SfPdfViewer.memory(rolePlayConvoProvider.pdfPath!))
          :  Center(
            child: GestureDetector(
            onTap: rolePlayConvoProvider.pickPDF,
            
                child: Text('Please pick a PDF file to view.'),
              ),
          ),
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
