

import 'package:flutter/cupertino.dart';

class DataProviders extends ChangeNotifier{

   DateTime datTime = DateTime.now();

  void chage_datime(DateTime time){
    datTime =  time;
    notifyListeners();
  }

  void resetdate(){
    datTime = DateTime.now();
    notifyListeners();
  }


}