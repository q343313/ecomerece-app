

import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/data/Customsignupwidgets.dart';
import 'package:ecomrece_app/data/signup_screens/signupscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),

              UiHelpers.Customtext(text: "Forget Password",
                  fontsize: 40,
                  fontfamily: "bold",
                  context: context),

              SizedBox(height: 20,),
              UiHelpers.Customtext(text: "Send Email",
                  fontsize: 20,
                  fontfamily: "bold",
                  context: context),
              SizedBox(height: 20,),

              UiHelpers.Customtextfield(hinttext: "Email",
                  context: context,
                  preffixicon: Icon(Icons.email),
                  controller: emailcontroller,
                  textinputype: TextInputType.text),
              SizedBox(height: 50,),

              UiHelpers.Custombutton(buttonname: "Send email",
                  callback: (){
                if (_formkey.currentState!.validate()){
                  CustomDataWidget().resetpassword(emailcontroller.text, context);
                  emailcontroller.clear();
                }

                  })
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelpers.Customtext(text: "Don't Have Account?",
              fontsize: 20,
              context: context),
          SizedBox(width: 6,),
          UiHelpers.Customtextbutton(buttonanme: "Sign in",
              callback: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signupscreens()));
              })
        ],
      ),
    );
  }
}
