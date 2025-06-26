

import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Appsettingscreen extends StatefulWidget {
  const Appsettingscreen({super.key});

  @override
  State<Appsettingscreen> createState() => _AppsettingscreenState();
}

class _AppsettingscreenState extends State<Appsettingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelpers.Customtext(text: "Setting Screens",
            fontsize: 20,
            fontfamily: "bold",
            context: context),
        centerTitle: true,
      ),
    );
  }
}
