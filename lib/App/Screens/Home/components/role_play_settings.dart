
import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';
import 'package:chatgpt_role_play/App/Provider/role_play_convo_provider.dart';
import 'package:chatgpt_role_play/App/Screens/Home/components/drop_down.dart';
import 'package:chatgpt_role_play/WidgetsAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RolePlaySettings extends StatelessWidget {
  final HomeProvider homeProvider;
  const RolePlaySettings({
    required this.homeProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(top: 54, bottom: 60,left: 65, right: 89),
       
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
             const SizedBox(
                height: 30,
              ),
                Text('Role Play - Cold Calling Settings', style: Theme.of(context).textTheme.bodyMedium,),
               const SizedBox(
                  height: 11,
                ),
                Text('Tailor the Role play scenario to fit your real life situation.\nCustomize the experience to fit your specific prospects. ', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),),
          const SizedBox(
            height: 11,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Prospects Company Details ', style: Theme.of(context).textTheme.bodyMedium,),
                  SvgPicture.asset('assets/icons/alert.svg'),
                  ],
          
              ),
              const SizedBox(
                height: 21,
              ),
              AppDropdownInput(
                options: homeProvider.bussinessList,
                value: homeProvider.business, onChanged: (value){
                  homeProvider.getBusiness(value);
                }),
             const SizedBox(
              height: 18,
             ),
             AppDropdownInput(
              options: homeProvider.companyPositionList,
              value: homeProvider.companyPosition, onChanged: (value){
                homeProvider.getCompanyPosition(value);
              }),
             const SizedBox(
              height: 24,
             ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Prospects Main Problems/Pain Points ', style: Theme.of(context).textTheme.bodyMedium,),
                  SvgPicture.asset('assets/icons/alert.svg'),
                  ],
          
              ),
              const SizedBox(
                height: 21,
              ),
               AppDropdownInput(value: '', onChanged: (value){}),
             const SizedBox(
              height: 18,
             ),
             AppDropdownInput(value: '', onChanged: (value){}),
             const SizedBox(
              height: 18,
             ),
             AppDropdownInput(value: '', onChanged: (value){}),
             const SizedBox(
              height: 31,
             ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose Script ', style: Theme.of(context).textTheme.bodyMedium,),
                  SvgPicture.asset('assets/icons/alert.svg'),
                  ],
          
              ),
              const SizedBox(
                height: 16,
              ),
              AppDropdownInput(value: '', onChanged: (value){}),
              const SizedBox(
                height: 37,
              ),
              Text('Difficulty Level', style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.42,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: const RoundedRectSliderTrackShape(),
                  activeTrackColor: Colors.black.withOpacity(0.37),
                  inactiveTrackColor: Colors.black.withOpacity(0.37),
                  
                  thumbColor: Theme.of(context).primaryColor,
                  overlayColor:Colors.transparent,
                  inactiveTickMarkColor: Colors.black.withOpacity(0.37),
                 showValueIndicator: ShowValueIndicator.always,
                 valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: Theme.of(context).primaryColor,
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                child: Slider(
              
                  divisions: 10,
                  label: '${homeProvider.sliderValue.round()}',
                  max: 10,
                  min: 1,
                  value: homeProvider.sliderValue, onChanged: (value){
                    homeProvider.getChangeSliderValue(value: value);
                    print(homeProvider.sliderValue.round());
                  }),
              ),
            ),
          ),
         const SizedBox(
            height: 43,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Microphone Status: ',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
              Text('Connected',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: const Color(0xff149D52),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),)

            ],
          ),
         const SizedBox(
            height: 27,
          ),
      Center(child:    appButton(horizontalPadding: 20, verticalPadding: 6, color: Theme.of(context).primaryColor, title: 'Start Role Play', radius: 5, context: context, titleColor: Theme.of(context).scaffoldBackgroundColor, fontSize: 12, fontWeight: FontWeight.w500, onTap: ()async{
       

        Navigator.pushNamed(context, AppRoutes.roleplayconvoScreen);
         Provider.of<RolePlayConvoProvider>(context, listen:  false).sendMessage('You are a busy ${homeProvider.companyPosition} of a ${homeProvider.business} business answering the phone. You are not easily persuaded and are very skeptical and cautious when making decisions. New things do not really interest you unless you are really convinced about it. You are involved in a simulated cold call sales interaction where you play the role of a potential customer. Do not generate text, wait until someone is writing to you and have a conversation as a busy business owner would. Answer only with \"hi who is this?\" when someone first writes to you. You are not easily persuaded and ask common cold call objections. Apply a difficulty level from a scale of 1 to 10 where 1 is easy with low or no objections and 10 is where you have the most and hardest objections. Use difficulty level ${homeProvider.sliderValue.round()} in this role play.');
      }),),
      const SizedBox(
        height: 19,
      )
            ],
          ),
        ),
      ),
    );
  }
}

