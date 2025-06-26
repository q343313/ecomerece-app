
import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scafffolddarkmode
            : AppColors.scaffoldlightmode,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.scaffoldlightmode
              : AppColors.scafffolddarkmode,
          width: 2
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined),
          UiHelpers.Customtext(text: "add image",
              fontsize: 12,
              fontfamily: "bold",
              context: context)
        ],
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
   CustomImage({super.key,required this.image});

   DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
       image: image,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.scaffoldlightmode
                : AppColors.scafffolddarkmode,
            width: 2
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined),
          UiHelpers.Customtext(text: "add image",
              fontsize: 12,
              fontfamily: "bold",
              context: context)
        ],
      ),
    );
  }
}
