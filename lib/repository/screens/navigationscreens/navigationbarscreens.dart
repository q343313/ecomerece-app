


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:ecomrece_app/repository/screens/favoritescreens/favoritescreens.dart';
import 'package:ecomrece_app/repository/screens/home_screens/homescreens.dart';
import 'package:ecomrece_app/repository/screens/profilesscreens/profilesscreens.dart';
import 'package:ecomrece_app/repository/screens/setting_screens/appsettingscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NavigationBarScreen();
  }

}

class _NavigationBarScreen extends State<NavigationBarScreen>{

  List<Widget> screens = [
    Homescreens(),
    Favoritescreens(),
    Appsettingscreen(),
    Profilesscreens()
  ];

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(CupertinoIcons.settings),
          Icon(Icons.person_rounded),
        ],
        color: Theme.of(context).brightness == Brightness.dark
        ? Colors.blue.shade400
        : Colors.blue.shade100,
        index: index,
        buttonBackgroundColor: Theme.of(context).brightness == Brightness.dark
        ? AppColors.scafffolddarkmode
        : AppColors.scaffoldlightmode,
        onTap: (value){
          setState(() {
            index = value;
          });
        },
      ),
      body: IndexedStack(
        index: index,
        children: screens,
      ),
    );
  }

}