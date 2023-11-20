
import 'package:chatgpt_role_play/App/Constant/appButton/app_button.dart';
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';
import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 46),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20)
      ),
       width: size.width * 0.832,
          height: size.height * 0.7895,
      child: homeProvider.selectedIndex == -1 ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Cold Calling Practice', style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(
            height: 24,
          ),
          Text('Improve your cold calling skills by engaging inrealistic sales\nconversations.',textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(
            height: 24,
          ),
         appButton(
          onTap: (){
            homeProvider.getSelectedIndex(index: 0);
          },
          horizontalPadding: 40, verticalPadding: 12, color: Theme.of(context).primaryColor, title: 'Start Role Play', radius: 15, context: context, titleColor: Colors.white, fontSize: 16, fontWeight: FontWeight.w500,) 
        ],
      ) : homeProvider.selectedIndex == 0 ? Column(
        children: [
          
             Padding(
               padding: const EdgeInsets.only(top: 30, right: 34),
               child: Align(
                alignment: Alignment.centerRight,
                child:FittedBox(child: appIconButton(
                  icon: 'assets/icons/upload.svg',
                  horizontalPadding: 32, verticalPadding: 15, color: Theme.of(context).hoverColor, title: 'Upload Script', radius: 15, context: context, titleColor: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w500, onTap: (){},),
                           ),
                         ),
             )
        ],
      ) : SizedBox(),
    );
  }
}
