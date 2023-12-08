import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier{
  var _themeMode = ThemeMode.light; //initilly it is light belove we are setting theam 
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode){
    _themeMode= themeMode;
    notifyListeners();

  }
}