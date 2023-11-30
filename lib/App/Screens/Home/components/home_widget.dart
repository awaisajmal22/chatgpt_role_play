
import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';
import 'package:chatgpt_role_play/App/Provider/role_play_convo_provider.dart';
import 'package:chatgpt_role_play/App/Screens/Home/components/role_play_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.size,
    required this.homeProvider,
  });

  final Size size;
  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF8FAFB),
        ),
            //  height: size.height  * 0.915,
        child: homeProvider.selectedIndex == -1 ? Container(
          margin: const EdgeInsets.only(top: 54, bottom: 60,left: 65, right: 89),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 17),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Role Play - Cold Calling', style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Sharpen your skills by engaging in a \nlifelike cold call simulation. ',textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),),
                const SizedBox(
                  height: 24,
                ),
                Text('Practice and refine your pitch, objection handling \nand closing techniques with AI-driven \nconversation.',textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16,
                ),),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Text('Objective:  ', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w800,
                  fontSize: 16,),),
                  Text('Schedule an appointment with the \nprospect that you talk to.', textAlign: TextAlign.start, style: Theme.of(context).textTheme.titleSmall!.copyWith(
                     
                  fontSize: 16,),),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                             appButton(
                onTap: (){
                  homeProvider.getSelectedIndex(index: 0);
                 
                },
                horizontalPadding: 40, verticalPadding: 12, color: Theme.of(context).primaryColor, title: 'Continue', radius: 5, context: context, titleColor: Colors.white, fontSize: 12, fontWeight: FontWeight.w500,) 
                  ],
                ),
              )
              
            ],
          ),
        ) : homeProvider.selectedIndex == 0 ? RolePlaySettings(
          homeProvider: homeProvider,
        ) : const SizedBox(),
      ),
    );
  }
}
