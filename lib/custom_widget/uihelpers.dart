


import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelpers{
  static Customimage({
    required String img,
    double?width,
    double?height
}){
    return Image(image: AssetImage("assets/images/$img"),width: width??300,height: height??300,);
  }

  static Customcircleavatar({
    required double radius,
    String?img,
    Color?color,
    Widget?child
}){
    return CircleAvatar(
      backgroundImage: AssetImage("assets/images/$img"),
      radius: radius,
      backgroundColor: color??AppColors.buttondarkmode,
      child: child,
    );
  }

  static Customtext({
    required String text,
    required double fontsize,
    String?fontfamily,
    required BuildContext context,
}){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily??"regular",
        color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.textdarkmode
            : AppColors.textlightmode
      ),
    );
  }

  static Customtextbutton({
    required String buttonanme,
    double?fontsize,
    String?fontfamily,
    required VoidCallback callback,
    Color?color
}){
    return TextButton(onPressed: (){callback();}, child: Text(
      buttonanme,
      style: TextStyle(
        fontFamily: fontfamily??"bold",
        fontSize: fontsize??20,
        color: color??AppColors.buttondarkmode,

      ),
    ));
  }

  static Custombutton({
    required String buttonname,
    required VoidCallback callback,
    double?width,
    double?height,
    Color?color
}){
    return SizedBox(
      height: height??55,
      width: width??270,
      child: ElevatedButton(onPressed: (){
        callback();
      }, child: Text(
        buttonname,
        style: TextStyle(
          fontSize: 23,
          fontFamily: "bold",

          color: AppColors.textdarkmode
        ),
      )),
    );
  }

  static Customtextfield({
    required String hinttext,
    required BuildContext context,
    required TextEditingController controller,
    required TextInputType textinputype,
    Icon?preffixicon,
    IconButton?sufficicon,
    bool?obstracttext,
    Function(String)?func,
    double?widht,
    double?height
}){
    return SizedBox(
      width:widht??370,
      height: height??55,
      child: Card(
        elevation: 10,
        color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.textfielddarkmode
        : AppColors.txtfieldlightmode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
        child: TextFormField(
        controller: controller,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Please enter $hinttext";
          }
          return null;
        },
        keyboardType: textinputype,
        obscureText: obstracttext??false,
        onChanged: func,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hinttext,
          hintStyle: TextStyle(
            fontFamily: "bold",
            fontSize: 16,
            color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.hintdarkmode
                : AppColors.hintlightmode
          ),
          prefixIcon: preffixicon,
          suffixIcon: sufficicon,

        ),
        ),
      ),
    );
  }


  static Customelevatedbutton({
    // required String buttonname,
    required VoidCallback callback,
    double?width,
    double?height,
    Color?color,
   required Widget?child
  }){
    return SizedBox(
      height: height??55,
      width: width??270,
      child: ElevatedButton(onPressed: (){
        callback();
      }, child: child),
    );
  }
}