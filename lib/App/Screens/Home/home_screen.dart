
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';

import 'package:chatgpt_role_play/App/Screens/Home/components/drawer_widget.dart';
import 'package:chatgpt_role_play/App/Screens/Home/components/home_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidth: size.width * 0.07,
        leading: Row(
          children: [
          const  SizedBox(
              width: 20,
            ), Container(
             
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: 
             NetworkImage("https://images.unsplash.com/photo-1532012197267-da84d127e765?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D"),
            fit: BoxFit.cover ),
            ),
           ),
          ],
        ),
        centerTitle: false,
        title: Text("Sales Role Play App", textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Column(
        
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
              color: const Color(0xffE8E8E8),
              width: 1
              )
            ),
            height: 1,
            
          ),
          Expanded(
            child: Row(
              children: [
                DrawerWidget(size: size, homeProvider: homeProvider),
                HomeWidget(size: size, homeProvider: homeProvider)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
