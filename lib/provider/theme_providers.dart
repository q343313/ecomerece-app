


import 'package:flutter/material.dart';

class ThemeProviders extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;

  change_theme(theme){
    themeMode = theme;
    notifyListeners();
  }


}