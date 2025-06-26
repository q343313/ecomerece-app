
import 'dart:io';

import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/data/Customsignupwidgets.dart';
import 'package:ecomrece_app/data/signup_screens/signupscreens.dart';
import 'package:ecomrece_app/provider/images_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/customwiget.dart';


class Loginscreens extends StatefulWidget {
  const Loginscreens({super.key});

  @override
  State<Loginscreens> createState() => _LoginscreensState();
}

class _LoginscreensState extends State<Loginscreens> {
  TextEditingController emailconteoller =TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ImageProviders>(
      builder: (context,value,child)=>
      Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelpers.Customtext(text: "Login Account",
                  fontsize: 30,
                  fontfamily: "bold",
                  context: context),

              SizedBox(height: 30,),
              InkWell(
                onTap:(){
                  imagedialog(
                      context,
                          (){
                        value.change_gallery();
                        value.getimage(context);
                        Navigator.pop(context);
                      } ,
                          (){
                        value.change_camera();
                        value.getimage(context);
                        Navigator.pop(context);
                      }
                  );
                },
                child: value.loginimage== null || value.loginimage!.path == ""?
                CustomContainer():CustomImage(image: DecorationImage(
                    image:FileImage(File(value.loginimage!.path).absolute),fit: BoxFit.cover )),
              ),


              SizedBox(height: 20,),

              UiHelpers.Customtextfield(hinttext: "UserName",
                  context: context,
                  controller: usernamecontroller,
                  preffixicon: Icon(Icons.account_circle),
                  textinputype: TextInputType.text),

              SizedBox(height: 15,),

              UiHelpers.Customtextfield(hinttext: "Email",
                  context: context,
                  controller: emailconteoller,
                  preffixicon: Icon(Icons.email),
                  textinputype: TextInputType.text),

              SizedBox(height: 15,),

              UiHelpers.Customtextfield(hinttext: "Password",
                  context: context,
                  controller: passwordcontroller,
                  obstracttext: value.obstact,
                  sufficicon: IconButton(onPressed: (){
                    value.chan_obst();
                  },
                      icon: Icon(value.obstact?Icons.visibility:Icons.visibility_off)),
                  preffixicon: Icon(Icons.lock),
                  textinputype: TextInputType.text),

              SizedBox(height: 15,),

              UiHelpers.Customtextfield(hinttext: "Number",
                  context: context,
                  controller: numbercontroller,
                  preffixicon: Icon(Icons.confirmation_num),
                  textinputype: TextInputType.text),

            ],
          ),
        ),
      ),
        floatingActionButton: UiHelpers.Custombutton(buttonname: "Login",
            callback: (){
          if(_formkey.currentState!.validate()){
            CustomDataWidget().loginaccount(
              emailconteoller.text
            , passwordcontroller.text,
            usernamecontroller.text,
            numbercontroller.text,
            value.loginimage!.path.toString(),

            context
            );
            value.resetloginimage();
          }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
