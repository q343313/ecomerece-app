


import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ecomrece_app/domain/constants/app_thems.dart';
import 'package:ecomrece_app/provider/data_providers.dart';
import 'package:ecomrece_app/provider/images_providers.dart';
import 'package:ecomrece_app/provider/theme_providers.dart';
import 'package:ecomrece_app/repository/screens/splash_screens/splash1_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'model/productmodels/productmodel.dart';
import 'model/profile_models.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var directry = await getApplicationDocumentsDirectory();
  Hive.init(directry.path);

  Hive.registerAdapter(ProfileModelAdapter());
 await Hive.openBox<ProfileModel>("profile");

  Hive.registerAdapter(ProductModelsAdapter());
 await Hive.openBox<ProductModels>("product");


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(DevicePreview(builder:(context)=> MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ThemeProviders()),
      ChangeNotifierProvider(create: (_)=>ImageProviders()),
      ChangeNotifierProvider(create: (_)=>DataProviders())
    ],
    builder: (context,state){
      final theme = Provider.of<ThemeProviders>(context).themeMode;
      return MaterialApp(

        themeMode:  theme,
        theme: AppThemes.lightthemedata,
        darkTheme: AppThemes.darkthemedata,
        title: "Ecomerece app",
        home: Splash1Screens(),

      );
    },);
  }

}