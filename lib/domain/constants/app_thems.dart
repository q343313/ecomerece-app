


import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:flutter/material.dart';

class AppThemes {

  static final ThemeData lightthemedata = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldlightmode,
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textlightmode),
      bodySmall: TextStyle(color: AppColors.textlightmode)
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonlightmode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29))
      )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldlightmode
    )
  );
  static final ThemeData darkthemedata = ThemeData(
      scaffoldBackgroundColor: AppColors.scafffolddarkmode,
      brightness: Brightness.dark,
      textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textdarkmode),
          bodySmall: TextStyle(color: AppColors.textdarkmode)
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttondarkmode,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29))
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.scafffolddarkmode
      )

  );
}