import 'package:chatgpt_role_play/App/Constant/Theme/theme.dart';
import 'package:chatgpt_role_play/App/Provider/home_provider.dart';
import 'package:chatgpt_role_play/App/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=> HomeProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme[ThemeType.lightTheme],
        home: const HomeScreen(),
      ),
    );
  }
}
