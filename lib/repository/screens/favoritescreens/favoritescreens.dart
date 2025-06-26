
import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Favoritescreens extends StatefulWidget {
  const Favoritescreens({super.key});

  @override
  State<Favoritescreens> createState() => _FavoritescreensState();
}

class _FavoritescreensState extends State<Favoritescreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelpers.Customtext(text: "Favorite Screen",
            fontsize: 20,
            fontfamily: "bold",
            context: context),
        centerTitle: true,
      ),
    );
  }
}
