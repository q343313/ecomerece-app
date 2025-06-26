

import 'dart:async';

import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/data/signup_screens/signupscreens.dart';
import 'package:ecomrece_app/repository/screens/clarifyscreen/clarufyscreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import '../../../boxes/boxes.dart';
import '../../../model/profile_models.dart';
import '../home_screens/homescreens.dart';

class Splash1Screens extends StatefulWidget {
  const Splash1Screens({super.key});

  @override
  State<Splash1Screens> createState() => _Splash1ScreensState();
}

class _Splash1ScreensState extends State<Splash1Screens>with TickerProviderStateMixin {

  late AnimationController _controller;
  late AnimationController sizecontainer;
  late Animation _animation;
  late Animation textanimation;

  Color textcolor = Colors.black;
  List<Color> color = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.yellow,
    Colors.orangeAccent,
    Colors.purple,
    Colors.greenAccent,
    Colors.pinkAccent
  ];

  TextEditingController emailcontroller = TextEditingController();

  var val = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 3),vsync: this)..repeat();
    sizecontainer = AnimationController(vsync: this,duration: Duration(seconds: 8));
    _animation = Tween(begin: 0.0,end: 270.0).animate(sizecontainer);
    textanimation  = Tween(begin: 0.0,end: 36.0).animate(sizecontainer);
    sizecontainer.addListener((){
      setState(() {

      });
    });
    sizecontainer.forward();

    change_color();
    change_screen();

    // change_image();
  }

  Timer?colortimer;
  Timer?screentimer;
  Timer?imagetimer;
  var index = 0;

  change_color(){
    colortimer  = Timer.periodic(Duration(milliseconds: 400), (_)=>setState(() {
      if (index >= 0 && index < 8){
        textcolor = color[index];
        index++;
      }else if(index == 8){
        index = 0;
      }
    }));
  }

  change_image(){
    imagetimer = Timer.periodic(Duration(seconds: 2), (_)=>setState(() {
      if(val >= 0 && val <3){
        val++;
      }else if(val == 3){
        val = 0;
      }
    }));
  }

  change_screen(){
    screentimer = Timer.periodic(Duration(seconds: 9), (_)=>
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Clarufyscreens())));
  }

  final _formkey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    colortimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder(
                animation: _controller,
                builder: (context,Widget?child){
                  return Transform.rotate(angle: _controller.value * 2.0 * math.pi,
                  child: child,);
                },
            child: Container(
              width: double.infinity,
              height: 300,
              child: AnimatedSwitcher(
                  duration: Duration(seconds: 2),
              child: IndexedStack(
                index: val,
                children: [
                  UiHelpers.Customimage(img: "ecom1.png",width: _animation.value,height: _animation.value),
                  // UiHelpers.Customimage(img: "note1.png",width: _animation.value,height: _animation.value),
                  // UiHelpers.Customimage(img: "note2.png",width: _animation.value,height: _animation.value),
                  // UiHelpers.Customimage(img: "note3.png",width: _animation.value,height: _animation.value),
                ],
              ),),
            ),),

            SizedBox(height: 10,),

            Text("Ecommerce App",
              style: TextStyle(
                color: textcolor,
                fontSize: textanimation.value,
                fontFamily: "bold"
              ),
            )


          ],
        ),
      ),
    );
  }

  Future<void>clarifydialog(){
    return showDialog(
        context: context,
        builder: (context){
          return Form(
            key: _formkey,
            child: AlertDialog(
              title: UiHelpers.Customtext(text: "For Clarify",
                  fontsize: 20,
                  fontfamily: "bold",
                  context: context),

              content: UiHelpers.Customtextfield(hinttext: "Email",
                  context: context,
                  controller: emailcontroller,
                  preffixicon: Icon(Icons.email),
                  textinputype: TextInputType.text),

              actions: [
                UiHelpers.Customtextbutton(buttonanme: "clear",
                    callback: (){
                      if(_formkey.currentState!.validate()){
                        var box = Boxes.profiledata();
                        var data = box.values.toList().cast<ProfileModel>();
                        for(var i in data){
                          if(i.email == emailcontroller.text){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreens()));
                          }else{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signupscreens()));
                          }
                          Navigator.pop(context);
                        }

                      }
                    })
              ],

            ),
          );
        });
  }
}
