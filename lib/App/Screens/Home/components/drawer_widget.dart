
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';
import 'package:chatgpt_role_play/App/Screens/Home/components/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.size,
    required this.homeProvider,
  });

  final Size size;
  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.12,
      height: size.height * 0.7895,
      child: Column(
        children: [
          Expanded(child: 
          ListView.builder(
            itemCount: homeProvider.drawerList.length,
            itemBuilder: (context, index){
            return drawerTile(
              onTap: (){
                homeProvider.getSelectedIndex(index: index);
              },
              color: homeProvider.selectedIndex == index ? Color(0xffF1F9FF) : Color(0xffFFFFFF), title: homeProvider.drawerList[index].title, context: context, titleColor: homeProvider.selectedIndex==index ? Color(0xff1279FC) : Color(0xff2c3333).withOpacity(0.70), icon: homeProvider.drawerList[index].icon);
          })),
          
    Container(
    height: size.height * 0.06,
    width: size.width * 0.052,
                decoration: const BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(image: 
                 NetworkImage("https://images.unsplash.com/photo-1532012197267-da84d127e765?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D"),
                fit: BoxFit.cover ),
                ),
               ),
             const  SizedBox(
                height: 17,
               ),
               SvgPicture.asset('assets/icons/about.svg', height: 24, width: 24,),
             
        ],
      ),
    );
  }
}