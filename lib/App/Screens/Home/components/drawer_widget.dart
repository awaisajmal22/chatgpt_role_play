
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      width: 273,
      // height: size.height  * 0.915,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 35, right: 22.45, top: 24, bottom: 36,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 52, width: 52,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1297349747/photo/hot-air-balloons-flying-over-the-botan-canyon-in-turkey.jpg?s=612x612&w=0&k=20&c=kt8-RRzCDunpxgKFMBBjZ6jSteetNhhSxHZFvHQ0hNU=', ), fit: BoxFit.cover,)
                  ),
                ),
           const     SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text('Gavano', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700
                      ),),
                    ),
                    FittedBox(
                      child: Text('Gavano', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),),
                    ),
                    
                  ],
                ),
             const   Spacer(),
GestureDetector(
  onTap: (){},
  child: SvgPicture.asset('assets/icons/more.svg'))
              ],
            ),
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: homeProvider.drawerList.length,
            itemBuilder: (context, index){
            return drawerTile(
              indicatorColor: homeProvider.selectedIndex == index ?Theme.of(context).primaryColor : Colors.transparent,
              onTap: (){
                homeProvider.getSelectedIndex(index: index);
              },
              color: homeProvider.selectedIndex == index ? Color(0xffF8F8F8) : Color(0xffFFFFFF), title: homeProvider.drawerList[index].title, context: context, titleColor: homeProvider.selectedIndex==index ? Color(0xff1279FC) : Color(0xff2c3333).withOpacity(0.70), icon: homeProvider.drawerList[index].icon);
          })),
     
             
        ],
      ),
    );
  }
}