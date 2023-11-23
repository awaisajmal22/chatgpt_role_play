import 'package:chatgpt_role_play/App/Models/drawer_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  List<DrawerModel> drawerList = <DrawerModel>[
DrawerModel(icon: "assets/icons/dashboard.svg", title: 'Dashboard'),
DrawerModel(icon: 'assets/icons/user.svg', title: 'Role Play'),
  ];
  int _selectedIndex = -1;
int get selectedIndex => _selectedIndex;
getSelectedIndex({required int index}){
  _selectedIndex = index;
  notifyListeners();
}
//Slider 
double _sliderValue = 1;
double get sliderValue => _sliderValue;
getChangeSliderValue({required double value}){
  _sliderValue = value;
  notifyListeners();
}
}