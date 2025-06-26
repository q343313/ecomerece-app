
import 'dart:io';

import 'package:ecomrece_app/boxes/boxes.dart';
import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/model/profile_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Profilesscreens extends StatefulWidget {
  const Profilesscreens({super.key});

  @override
  State<Profilesscreens> createState() => _ProfilesscreensState();
}

class _ProfilesscreensState extends State<Profilesscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelpers.Customtext(text: "Profiles screens",
            fontsize: 20,
            fontfamily:'bold',
            context: context),
      ),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Boxes.profiledata().listenable(),
                builder: (context,Box box,_){
                  var data = box.values.toList().cast<ProfileModel>();
                  return Expanded(child: ListView.builder(itemCount: data.length,
                  itemBuilder: (context,index){
                    return Customlisttile(
                        title: data[index].username.toString(),
                        subtitle: data[index].email.toString(),
                        image: data[index].image.toString(),
                      callback: (){
                          deleteuser(data[index]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Deleted Succesfully")));
                      },
                    );
                  },));
                })
          ],
        ),
      ),
    );
  }
}

Future<void> deleteuser(ProfileModel user){
  return user.delete();
}

class Customlisttile extends StatelessWidget {
   Customlisttile({super.key,required this.title,required this.subtitle,required this.image,required this.callback});

   String image;
   String title;
   String subtitle;
   VoidCallback callback;



  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:CircleAvatar(
        backgroundImage: FileImage(File(image).absolute),
        radius: 40,
      ) ,
      title: UiHelpers.Customtext(
          text: title,
          fontsize: 20,
          fontfamily: "bold",
          context: context),
      subtitle: UiHelpers.Customtext(text: subtitle,
          fontsize: 13,
          fontfamily: "bold",
          context: context),
      trailing: IconButton(onPressed: (){callback();},
         icon: Icon( Icons.delete)),
    );
  }
}

