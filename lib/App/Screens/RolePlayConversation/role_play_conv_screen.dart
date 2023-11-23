import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:flutter/material.dart';

import 'component/message_tile.dart';

class RolePlayConversationScreen extends StatelessWidget {
  const RolePlayConversationScreen({super.key});

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
        child: Column(
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
                        itemCount: 3,
                        itemBuilder: (context, index){
                    return MessageTile(
                      isUSerSide: index.isEven ? true : false,
                    );
                      }),
                    ),const SizedBox(
              height: 21,
            ),
      Padding(padding: const EdgeInsets.only(right: 46),
      child:  appButton(horizontalPadding: 36, verticalPadding: 6, color: Theme.of(context).primaryColor, title: 'Finish', radius: 5, context: context, titleColor: Theme.of(context).scaffoldBackgroundColor, fontSize: 12, fontWeight: FontWeight.w500, onTap: (){}),),
                  ],
                )
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
