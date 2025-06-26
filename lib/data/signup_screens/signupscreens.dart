
import 'dart:io';

import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/data/Customsignupwidgets.dart';
import 'package:ecomrece_app/data/google_sign/authscreens.dart';
import 'package:ecomrece_app/data/signup_screens/forget_password.dart';
import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:ecomrece_app/provider/images_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../custom_widget/customwiget.dart';

class Signupscreens extends StatefulWidget {
  const Signupscreens({super.key});

  @override
  State<Signupscreens> createState() => _SignupscreensState();
}

class _SignupscreensState extends State<Signupscreens>with TickerProviderStateMixin {
  late final AnimationController _controller;
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController usernamecontroller= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();
  TextEditingController numbercontroller= TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration:Duration(seconds: 3),vsync: this)..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

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
              SizedBox(height: 20,),
              UiHelpers.Customtext(text: "Create Account",
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
                child: value.image_path== null || value.image_path!.path == ""?
                CustomContainer():CustomImage(image: DecorationImage(
                    image:FileImage(File(value.image_path!.path).absolute),fit: BoxFit.cover )),
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
                  controller: emailcontroller,
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
          
              UiHelpers.Customtextfield(hinttext: "PhoneNumber",
                  context: context,
                  controller: numbercontroller,
                  preffixicon: Icon(Icons.numbers),
                  textinputype: TextInputType.text),
          
              Align(
                alignment: Alignment.topRight,
                child: UiHelpers.Customtextbutton(buttonanme: "Forget Password?",
                    callback: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                    }),
              ),
          
              SizedBox(height: 20,),
          
              UiHelpers.Customelevatedbutton(
                child: value.circle == false?Text("Sign up",style: TextStyle(
                  fontFamily: "bold",fontSize: 23,color: AppColors.scaffoldlightmode
                ),):SpinKitFadingCircle(
                  controller: _controller,
                  color: AppColors.scaffoldlightmode,
                ),
                  callback: (){
                if(_formkey.currentState!.validate()){

                    CustomDataWidget().signup(
                        usernamecontroller.text,
                        emailcontroller.text,
                        passwordcontroller.text,
                        numbercontroller.text,
                        value.image_path!.path.toString(),
                        context
                    );
                    value.change_circle();
                    value.image_path==null;
                    usernamecontroller.clear();
                    emailcontroller.clear();
                    passwordcontroller.clear();
                    numbercontroller.clear();

                }
                  }),
              
              SizedBox(height: 20,),
              CustomOutlinedButton(callback: (){
                AuthMethods().googlesignin(context);
              }, title: "Sign in With Google")
          
          
            ],
          ),
        ),
      ),
      ),
    );
  }


}


void imagedialog(BuildContext parentContext, VoidCallback onGallery, VoidCallback onCamera) {
  showModalBottomSheet(
    context: parentContext,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text("Photo Gallery"),
            onPressed: () {
              Navigator.pop(context);
              onGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text("Camera"),
            onPressed: () {
              Navigator.pop(context); // Dismiss the CupertinoActionSheet
              onCamera();
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context); // Dismiss the CupertinoActionSheet
          },
        ),
      );
    },
  );
}


class ReusableRow extends StatelessWidget {
   ReusableRow({super.key,required this.icon,required this.title,required this.callback});

  Icon icon;
String title;
VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){callback();},
      leading:icon ,
      title: UiHelpers.Customtext(text: title,
          fontsize: 17,
          context: context),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
   CustomOutlinedButton({super.key,required this.callback,required this.title});

  VoidCallback callback;
  String title;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 270,
      child: OutlinedButton(onPressed: (){callback();}, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/ecom1.png"),
            radius: 20,
          ),
          SizedBox(width: 9,),
          UiHelpers.Customtext(text: title,
              fontsize: 16,
              context: context)
        ],
      )),
    );
  }
}

