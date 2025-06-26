


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProviders extends ChangeNotifier{

  String? selectedCategory;

  final List<String> categories = [
    'Electronics',
    'Fashion',
    'Grocery',
    'Books',
    'Mobiles',
    'Toys',
    'Home Decor',
    'Beauty',
    'Sports',
    'Footwear'
  ];

  change_selected(value){
    selectedCategory = value;
    notifyListeners();
  }

  bool circle = false;

  change_circle(){
    circle  =true;
    notifyListeners();
  }

  bool obstact = true;
   chan_obst(){
     if(obstact == true){
       obstact =false;
     }else if(obstact == false){
       obstact = true;
     }
     notifyListeners();
   }

  bool gallery = false;
  File?image_path;
  File?productimage;
  File?loginimage;

  void resetprofileimage(){
    image_path = null;
    notifyListeners();
  }

  void resetproductimage(){
    productimage = null;
    notifyListeners();
  }

  void resetloginimage(){
    loginimage= null;
    notifyListeners();
  }


  final _picked = ImagePicker();

  void change_gallery(){
    if(gallery == false){
      gallery = true;
    }else{
      gallery = true;
    }
    notifyListeners();
  }

  void change_camera(){
    if(gallery == true){
      gallery = false;
    }else{
      gallery = false;
    }
    notifyListeners();
  }

  Future getimage(BuildContext context)async{
    var pickedimage = await _picked.pickImage(source: gallery?ImageSource.gallery:ImageSource.camera,imageQuality: 80);

    if (pickedimage != null){
      image_path = File(pickedimage.path);
      productimage = File(pickedimage.path);
      loginimage = File(pickedimage.path);
      notifyListeners();
    }else{
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Image Upload failed")));
    }
  }
}