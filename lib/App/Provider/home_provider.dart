import 'package:chatgpt_role_play/App/Models/drawer_model.dart';
import 'package:flutter/material.dart';

import '../Services/open_ai_services.dart';

class HomeProvider extends ChangeNotifier{
  final OpenAIService openAIService = OpenAIService();
  List<DrawerModel> drawerList = <DrawerModel>[
DrawerModel(icon: "assets/icons/dashboard.svg", title: 'Dashboard'),
DrawerModel(icon: 'assets/icons/user.svg', title: 'Role Play'),
  ];

String _business = 'Solar';
String get business => _business;
getBusiness(String value){
_business = value;
notifyListeners();
}
String _companyPosition = 'Owner';
String get companyPosition => _companyPosition;
getCompanyPosition(String value){
  _companyPosition = value;
  notifyListeners();
}
  List companyPositionList = [
    'Owner',
'CEO',
'COO',
'CFO',
'Sales manager',
 'Marketing manager',
];
List<String> bussinessList = <String>[
  'Solar',
   'Roofing', 'Marketing', 'Lawyer',
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