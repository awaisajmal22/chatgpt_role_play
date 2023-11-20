import 'package:chatgpt_role_play/App/Models/drawer_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  List<DrawerModel> drawerList = <DrawerModel>[
DrawerModel(icon: "assets/icons/home.svg", title: 'Home'),
DrawerModel(icon: 'assets/icons/setting.svg', title: 'Settings'),
  ];
  int _selectedIndex = -1;
int get selectedIndex => _selectedIndex;
getSelectedIndex({required int index}){
  _selectedIndex = index;
  notifyListeners();
}
}