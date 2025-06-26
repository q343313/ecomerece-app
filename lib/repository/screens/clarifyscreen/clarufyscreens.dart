
import 'package:ecomrece_app/repository/screens/navigationscreens/navigationbarscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../boxes/boxes.dart';
import '../../../custom_widget/uihelpers.dart';
import '../../../data/signup_screens/signupscreens.dart';
import '../../../model/profile_models.dart';
import '../home_screens/homescreens.dart';

class Clarufyscreens extends StatefulWidget {
  const Clarufyscreens({super.key});

  @override
  State<Clarufyscreens> createState() => _ClarufyscreensState();
}

class _ClarufyscreensState extends State<Clarufyscreens> {
  TextEditingController emailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                CircleAvatar(
                  backgroundImage:AssetImage("assets/images/ecom1.png"),
                  radius: 140,
                ),
                SizedBox(height: 14,),
            
                UiHelpers.Customtext(text: "Check Your Account",
                    fontsize: 20,
                    fontfamily: "bold",
                    context: context),
                SizedBox(height: 20,),
            
                UiHelpers.Customtextfield(hinttext: "Email",
                    context: context,
                    controller: emailcontroller,
                    preffixicon: Icon(Icons.email),
                    textinputype: TextInputType.text),
            
              ],
            ),
          ),
        ),

      ),
      floatingActionButton: UiHelpers.Custombutton(buttonname: "Clear",
          callback: () {
            if (_formkey.currentState!.validate()) {
              var box = Boxes.profiledata();
              var data = box.values.toList().cast<ProfileModel>();


              bool found = data.any((element) => element.email == emailcontroller.text);

              if (found) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavigationBarScreen()));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signupscreens()));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please first Signup")));
              }
            }
          }

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}


