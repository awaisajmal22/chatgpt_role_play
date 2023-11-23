import 'package:chatgpt_role_play/App/Screens/Home/home_screen.dart';
import 'package:chatgpt_role_play/App/Screens/RolePlayConversation/role_play_conv_screen.dart';
import 'package:chatgpt_role_play/WidgetsAndBindings/app_routes.dart';
import 'package:flutter/material.dart';

class AppPages{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case (AppRoutes.homeScreen): return MaterialPageRoute(builder: (context){
        return const HomeScreen();
      });
 
      case (AppRoutes.roleplayconvoScreen): return MaterialPageRoute(builder: (context){
        return const RolePlayConversationScreen();
      });

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Route Error..',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    });
  }
}