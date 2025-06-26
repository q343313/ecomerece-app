// //
// //
// //
//
//
//
//
//
// import 'dart:io';
//
// import 'package:ecomrece_app/boxes/boxes.dart';
// import 'package:ecomrece_app/custom_widget/customwiget.dart';
// import 'package:ecomrece_app/custom_widget/uihelpers.dart';
// import 'package:ecomrece_app/data/signup_screens/signupscreens.dart';
// import 'package:ecomrece_app/domain/constants/app_colora.dart';
// import 'package:ecomrece_app/model/productmodels/productmodel.dart';
// import 'package:ecomrece_app/model/profile_models.dart';
// import 'package:ecomrece_app/provider/data_providers.dart';
// import 'package:ecomrece_app/provider/images_providers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hive_flutter/adapters.dart'; // Make sure this is imported
// import 'package:provider/provider.dart';
//
// class Homescreens extends StatefulWidget {
//   const Homescreens({super.key});
//
//   @override
//   State<Homescreens> createState() => _HomescreensState();
// }
//
// class _HomescreensState extends State<Homescreens> {
//   TextEditingController emailcontroller= TextEditingController();
//   TextEditingController productnamecontroller = TextEditingController();
//   TextEditingController productdescriptioncontroller= TextEditingController();
//   TextEditingController locationcontroller  = TextEditingController();
//   TextEditingController pricecontroller=  TextEditingController();
//
//   final _formkey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     emailcontroller.dispose();
//     productnamecontroller.dispose();
//     productdescriptioncontroller.dispose();
//     locationcontroller.dispose();
//     pricecontroller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: UiHelpers.Customtext(text: "Home Screens",
//             fontsize: 20,
//             fontfamily: "bold",
//             context: context),
//       ),
//
//       body:
//
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             // Section to display all users
//             ValueListenableBuilder(
//               valueListenable: Boxes.profiledata().listenable(),
//               builder: (context, Box<ProfileModel> profileBox, _) {
//                 var users = profileBox.values.toList().cast<ProfileModel>();
//
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: users.length,
//                   itemBuilder: (context, index) {
//                     ProfileModel currentUser = users[index];
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: FileImage(File(currentUser.image).absolute),
//                                 radius: 30, // Adjusted radius for better fit
//                               ),
//                               SizedBox(width: 10),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   UiHelpers.Customtext(
//                                     text: currentUser.username.toString(),
//                                     fontsize: 18,
//                                     fontfamily: "bold",
//                                     context: context,
//                                   ),
//                                   UiHelpers.Customtext(
//                                     text: currentUser.email.toString(),
//                                     fontsize: 14,
//                                     context: context,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         ValueListenableBuilder(
//                           valueListenable: Boxes.productdata().listenable(),
//                           builder: (context, Box<ProductModels> productBox, _) {
//                             var userProducts = productBox.values
//                                 .where((product) => product.email == currentUser.email)
//                                 .toList()
//                                 .cast<ProductModels>();
//
//                             if (userProducts.isEmpty) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                                 child: Text("No products for ${currentUser.username} yet.", style: TextStyle(color: Colors.grey)),
//                               );
//                             }
//
//                             return SizedBox(
//                               height: 250, // Fixed height for horizontal product list
//                               child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: userProducts.length,
//                                 itemBuilder: (context, productIndex) {
//                                   ProductModels product = userProducts[productIndex];
//                                   return SizedBox(
//                                     width: 180, // Slightly reduced width for more items visible
//                                     child: Card(
//                                       elevation: 5, // Reduced elevation for less harsh shadow
//                                       margin: const EdgeInsets.all(8.0), // Added margin for spacing
//                                       color: Theme.of(context).brightness == Brightness.dark
//                                           ? AppColors.scafffolddarkmode // Ensure this is a dark background color
//                                           : AppColors.scaffoldlightmode,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Expanded( // Use Expanded for the image container
//                                             child: Container(
//                                               width: double.infinity, // Take full width of the card
//                                               decoration: BoxDecoration(
//                                                 borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)), // Rounded corners for top
//                                                 image: DecorationImage(
//                                                   image: FileImage(File(product.productiamge).absolute),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 UiHelpers.Customtext(
//                                                   text: product.productname.toString(),
//                                                   fontsize: 16,
//                                                   fontfamily: "bold",
//                                                   context: context,
//                                                 ),
//                                                 UiHelpers.Customtext(
//                                                   text: "\$${product.productprice}",
//                                                   fontsize: 14,
//                                                   fontfamily: "bold",
//                                                   context: context,
//                                                   // color: Colors.green, // Highlight pric
//                                                 ),
//                                                 UiHelpers.Customtext(
//                                                   text: product.categry.toString(),
//                                                   fontsize: 12,
//                                                   context: context,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                         Divider(height: 20, thickness: 1, indent: 16, endIndent: 16), // Separator between users
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//
//           _productdialog(context);
//         },
//         backgroundColor: AppColors.buttondarkmode,
//         child: Icon(Icons.add),),
//     );
//
//   }
//
//
//   Future<void> _productdialog(BuildContext parentContext) async {
//     return showDialog(
//         context: parentContext,
//         builder: (dialogContext){
//           return Consumer<ImageProviders>(
//             builder: (consumerImageContext, imageProvider, child)=>
//                 Consumer<DataProviders>(
//                   builder: (consumerDataContext, dataProvider, child)=>
//                       AlertDialog(
//                         // Ensure correct colors for dark/light mode
//                         backgroundColor: Theme.of(context).brightness == Brightness.dark
//                             ? AppColors.scafffolddarkmode // Use a dark background color for dark mode
//                             : AppColors.scaffoldlightmode,
//                         title: UiHelpers.Customtext(text: "Add Products",
//                             fontsize: 20,
//                             fontfamily: "bold",
//                             context: consumerImageContext),
//
//                         content: SingleChildScrollView(
//                           child: Center(
//                             child: Form(
//                               key:  _formkey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min, // Keep column tight
//                                 children: [
//                                   InkWell(
//                                     onTap: (){
//                                       imagedialog(
//                                           consumerImageContext, // Pass the dialog's context
//                                               (){
//                                             imageProvider.change_gallery();
//                                             imageProvider.getimage(consumerImageContext);
//                                           },
//                                               (){
//                                             imageProvider.change_camera();
//                                             imageProvider.getimage(consumerImageContext);
//                                           });
//                                     },
//                                     child: imageProvider.productimage == null || imageProvider.productimage!.path.isEmpty ?
//                                     CustomContainer():CustomImage(
//                                         image: DecorationImage(image: FileImage(File(imageProvider.productimage!.path).absolute),fit: BoxFit.cover)),
//                                   ),
//
//                                   SizedBox(height: 10,),
//
//                                   UiHelpers.Customtextfield(hinttext: "For Check Enter email",
//                                       context: consumerImageContext, controller: emailcontroller,
//                                       preffixicon: Icon(Icons.email),
//                                       textinputype: TextInputType.emailAddress, // More appropriate keyboard
//                                      ),
//
//                                   SizedBox(height: 10,),
//
//                                   UiHelpers.Customtextfield(hinttext: "enter Product title",
//                                       context: consumerImageContext, controller: productnamecontroller,
//                                       preffixicon: Icon(Icons.production_quantity_limits),
//                                       textinputype: TextInputType.text,
//                                       ),
//
//                                   SizedBox(height: 10,),
//
//                                   UiHelpers.Customtextfield(hinttext: "enter Product price",
//                                       context: consumerImageContext, controller: pricecontroller,
//                                       preffixicon: Icon(Icons.price_change),
//                                       textinputype: TextInputType.number, // Numeric keyboard
//                                       ),
//
//                                   SizedBox(height: 10,),
//
//                                   UiHelpers.Customtextfield(hinttext: "description",
//                                       context: consumerImageContext, controller: productdescriptioncontroller,
//                                       preffixicon: Icon(Icons.description),
//                                       height: 100,
//                                       textinputype: TextInputType.text,),
//
//                                   SizedBox(height: 10,),
//
//                                   UiHelpers.Customtextfield(hinttext: "Location",
//                                       context: consumerImageContext, controller: locationcontroller,
//                                       preffixicon: Icon(Icons.location_on_rounded),
//                                       textinputype: TextInputType.text,),
//
//
//                                   SizedBox(height: 10,),
//
//                                   CustomCardWidget(
//                                     icon: Icon(Icons.category),
//                                     child: DropdownButtonHideUnderline(
//                                         child: DropdownButton<String>(
//                                             value: imageProvider.selectedCategory,
//                                             hint:  Text("Category",style: TextStyle(
//                                                 color: Theme.of(consumerImageContext).brightness == Brightness.dark
//                                                     ? AppColors.hintdarkmode
//                                                     : AppColors.hintlightmode,
//                                                 fontSize: 15,
//                                                 fontFamily: "bold"
//
//                                             ),),
//                                             style: TextStyle(color: Theme.of(consumerImageContext).brightness == Brightness.dark
//                                                 ? AppColors.hintdarkmode
//                                                 : AppColors.hintlightmode,
//                                                 fontSize: 15,
//                                                 fontFamily: "bold"
//                                             ),
//                                             // isExpanded: true, // Use if you want it to expand to fill space
//                                             icon: const Icon(Icons.arrow_drop_down),
//                                             items: imageProvider.categories.map((String categoryValue) {
//                                               return DropdownMenuItem<String>(
//                                                 value: categoryValue,
//                                                 child: Text(categoryValue),
//                                               );
//                                             }).toList(),
//                                             onChanged: (newvalue){
//                                               imageProvider.change_selected(newvalue);
//                                             }
//                                         )),
//                                   ),
//
//                                   SizedBox(height: 10,),
//                                   InkWell(
//                                     onTap: ()async{
//                                       DateTime? dattime = await showDatePicker(
//                                           context: consumerImageContext, // Use dialog's context
//                                           firstDate: DateTime(2000), // Allow older dates if needed
//                                           lastDate: DateTime.now());
//                                       if(dattime != null){
//                                         dataProvider.chage_datime(dattime);
//                                       }
//                                     },
//                                     child: CustomCardWidget(
//                                         icon: Icon(Icons.calendar_month_outlined),
//                                         child: Text(
//                                           dataProvider.datTime != null
//                                               ? "${dataProvider.datTime!.day.toString().padLeft(2, '0')}/${dataProvider.datTime!.month.toString().padLeft(2, '0')}/${dataProvider.datTime!.year.toString()}"
//                                               : "Select Date"
//                                           ,style: TextStyle(
//                                             color: Theme.of(consumerImageContext).brightness == Brightness.dark
//                                                 ? AppColors.hintdarkmode
//                                                 : AppColors.hintlightmode,
//                                             fontSize: 15,
//                                             fontFamily: "bold"
//                                         ),)
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         actions: [
//                           UiHelpers.Customtextbutton(buttonanme: "Cancel",
//                               callback: (){
//                                 Navigator.pop(dialogContext); // Use dialogContext to pop
//                               }),
//                           SizedBox(width: 10,),
//                           UiHelpers.Customtextbutton(
//                             buttonanme: "Add",
//                             callback: () {
//                               if (_formkey.currentState!.validate()) { // Validate form fields
//                                 if (imageProvider.productimage == null || imageProvider.productimage!.path.isEmpty || imageProvider.selectedCategory == null || dataProvider.datTime == null) {
//                                   ScaffoldMessenger.of(consumerImageContext).showSnackBar(
//                                     SnackBar(content: Text("Please fill all the blanks, including selecting an image, category, and date.")),
//                                   );
//                                   return; // Do not dismiss the dialog
//                                 }
//
//                                 final profilebox = Boxes.profiledata();
//                                 final listdata = profilebox.values.toList().cast<ProfileModel>();
//                                 ProfileModel? foundProfile;
//
//                                 // Trim email text for reliable comparison
//                                 for (var i in listdata) {
//                                   if (i.email == emailcontroller.text.trim()) {
//                                     foundProfile = i;
//                                     break;
//                                   }
//                                 }
//
//                                 if (foundProfile != null) {
//                                   final data = ProductModels(
//                                     name: foundProfile.username,
//                                     email: foundProfile.email,
//                                     image: foundProfile.image,
//                                     number: foundProfile.number,
//                                     productname: productnamecontroller.text.trim(),
//                                     description: productdescriptioncontroller.text.trim(),
//                                     productprice: pricecontroller.text.trim(),
//                                     productlocation: locationcontroller.text.trim(),
//                                     productiamge: imageProvider.productimage!.path,
//                                     categry: imageProvider.selectedCategory!,
//                                     dateTime: dataProvider.datTime!, // Make sure date is not null
//                                   );
//
//                                   final productbox = Boxes.productdata();
//                                   productbox.add(data);
//                                   data.save(); // Don't forget to save the HiveObject
//
//                                   // Clear controllers and reset providers
//                                   emailcontroller.clear();
//                                   productnamecontroller.clear();
//                                   productdescriptioncontroller.clear();
//                                   locationcontroller.clear();
//                                   pricecontroller.clear();
//                                   imageProvider.resetproductimage(); // Call the correct reset method
//                                   dataProvider.resetdate();         // Call the correct reset method
//
//                                   ScaffoldMessenger.of(consumerImageContext).showSnackBar(
//                                     SnackBar(content: Text("Product Added Successfully!")),
//                                   );
//
//                                   Navigator.pop(dialogContext); // Dismiss dialog using dialogContext
//                                 } else {
//                                   ScaffoldMessenger.of(consumerImageContext).showSnackBar(
//                                     SnackBar(content: Text("No account found for this email. Please create an account first.")),
//                                   );
//                                   // Don't close dialog
//                                 }
//                               } else {
//                                 // If form validation fails (e.g., empty text fields)
//                                 ScaffoldMessenger.of(consumerImageContext).showSnackBar(
//                                   SnackBar(content: Text("Please fill all required text fields.")),
//                                 );
//                               }
//                             },
//                           )
//                         ],
//                       ),
//                 ),
//           );
//         });
//   }
//
// }
//
// class CustomCardWidget extends StatelessWidget {
//   CustomCardWidget({super.key,required this.child,required this.icon});
//
//   Widget child;
//   Icon icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 370,
//       height: 55,
//       child: Card(
//         elevation: 10,
//         color: Theme.of(context).brightness == Brightness.dark
//             ? AppColors.textfielddarkmode
//             : AppColors.txtfieldlightmode,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12.0),
//           child: Row(
//             children: [
//               icon,
//               SizedBox(width: 10,),
//               child,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//













//



import 'dart:io';


import 'package:ecomrece_app/boxes/boxes.dart';
import 'package:ecomrece_app/custom_widget/customwiget.dart';
import 'package:ecomrece_app/custom_widget/uihelpers.dart';
import 'package:ecomrece_app/data/signup_screens/signupscreens.dart';
import 'package:ecomrece_app/domain/constants/app_colora.dart';
import 'package:ecomrece_app/model/productmodels/productmodel.dart';
import 'package:ecomrece_app/model/profile_models.dart';
import 'package:ecomrece_app/provider/data_providers.dart';
import 'package:ecomrece_app/provider/images_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens> {
  TextEditingController emailcontroller= TextEditingController();
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController productdescriptioncontroller= TextEditingController();
  TextEditingController locationcontroller  = TextEditingController();
  TextEditingController pricecontroller=  TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final rootContext = context;

    return Scaffold(
      appBar: AppBar(
        title: UiHelpers.Customtext(text: "Home Screens",
            fontsize: 20,
            fontfamily: "bold",
            context: context),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Boxes.profiledata().listenable(),
                builder: (context,Box box,_){
                  var profiledata = box.values.toList().cast<ProfileModel>();

                  return ListView.builder(
                    shrinkWrap: true,
                    physics:NeverScrollableScrollPhysics(),
                    itemCount: profiledata.length,
                  itemBuilder: (context,index){
                    var data = profiledata[index];
                    return Column(
                      children: [
                       ListTile(
                         leading: CircleAvatar(
                           backgroundImage: FileImage(File(data.image).absolute),
                           radius: 40,
                         ),
                         title: UiHelpers.Customtext(
                             text: data.username.toString(),
                             fontsize: 20,
                             fontfamily: "bold",
                             context: context),
                         subtitle: UiHelpers.Customtext(text: data.email.toString(),
                             fontsize: 13,
                             fontfamily: "bold",
                             context: context),
                       ),

                        SizedBox(height: 20,),

                        ValueListenableBuilder(
                            valueListenable: Boxes.productdata().listenable(),
                            builder: (context,Box<ProductModels> box,_){
                              var productdata =box.values.where((product)=>product.email == data.email).toList().cast<ProductModels>();

                              if (productdata.isEmpty){
                                return Padding(padding: EdgeInsets.only(left: 20,top: 20,),
                                child: Text("No Product found of ${data.username}"),);
                              }
                              return SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productdata.length,
                                itemBuilder: (context,values){
                                  return SizedBox(
                                    width: 200,
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: FileImage(File(productdata[values].productiamge).absolute),fit: BoxFit.cover)
                                              ),
                                            ),
                                          ),
                                          Padding(padding: EdgeInsets.only(left: 10),
                                          child: Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              UiHelpers.Customtext(text: productdata[values].productname.toString(),
                                                  fontsize: 17,
                                                  fontfamily: "bold",
                                                  context: context),
                                              UiHelpers.Customtext(text:"\$${ productdata[values].productprice.toString()}",
                                                  fontsize: 17,
                                                  fontfamily: "bold",
                                                  context: context),
                                              UiHelpers.Customtext(text: productdata[values].categry.toString(),
                                                  fontsize: 17,
                                                  fontfamily: "bold",
                                                  context: context),
                                              SizedBox(height: 9,),
                                            ],
                                          ),)
                                        ],
                                      ),
                                    ),
                                  );
                                },),
                              );
                            }),

                        Divider(
                          color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white54
                          : Colors.black38,

                        )
                      ],
                    ) ;
                  },);
                }
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _productdialog(rootContext);
        },
      backgroundColor: AppColors.buttondarkmode,
      child: Icon(Icons.add),),
    );

  }

  Future _productdialog(BuildContext rootContext){
    return showDialog(
        context: context,
        builder: (context){
          return Consumer<ImageProviders>(
            builder: (context,value,child)=>
            Consumer<DataProviders>(
              builder: (context,items,child)=>
             AlertDialog(
               backgroundColor: Theme.of(context).brightness == Brightness.dark
               ? AppColors.hintlightmode
               : AppColors.scaffoldlightmode,
                title: UiHelpers.Customtext(text: "Add Products",
                    fontsize: 20,
                    fontfamily: "bold",
                    context: context),

                content: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key:  _formkey,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              imagedialog(
                                  context,
                                  (){
                                    value.change_gallery();
                                    value.getimage(context);

                                  },
                                  (){
                                    value.change_camera();
                                    value.getimage(context);

                                  });
                            },
                            child: value.productimage == null || value.productimage!.path == ""?
                            CustomContainer():CustomImage(
                                image: DecorationImage(image: FileImage(File(value.productimage!.path).absolute),fit: BoxFit.cover)),
                          ),

                          SizedBox(height: 10,),

                          UiHelpers.Customtextfield(hinttext: "For Check Enter email",
                              context: context, controller: emailcontroller,
                              preffixicon: Icon(Icons.email),
                              textinputype: TextInputType.text),

                          SizedBox(height: 10,),

                          UiHelpers.Customtextfield(hinttext: "enter Product title",
                              context: context, controller: productnamecontroller,
                              preffixicon: Icon(Icons.production_quantity_limits),
                              textinputype: TextInputType.text),

                          SizedBox(height: 10,),

                          UiHelpers.Customtextfield(hinttext: "enter Product price",
                              context: context, controller: pricecontroller,
                              preffixicon: Icon(Icons.price_change),
                              textinputype: TextInputType.text),

                          SizedBox(height: 10,),

                          UiHelpers.Customtextfield(hinttext: "description",
                              context: context, controller: productdescriptioncontroller,
                              preffixicon: Icon(Icons.description),
                              height: 100,
                              textinputype: TextInputType.text),

                          SizedBox(height: 10,),

                          UiHelpers.Customtextfield(hinttext: "Location",
                              context: context, controller: locationcontroller,
                              preffixicon: Icon(Icons.location_on_rounded),
                              textinputype: TextInputType.text),

                          SizedBox(height: 10,),

                          CustomCardWidget(
                            icon: Icon(Icons.category),
                              child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: value.selectedCategory,
                                          hint:  Text("Category",style: TextStyle(
                                              color: Theme.of(context).brightness == Brightness.dark
                                                  ? AppColors.hintdarkmode
                                                  : AppColors.hintlightmode,
                                            fontSize: 15,
                                            fontFamily: "bold"

                                          ),),
                                          style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                                          ? AppColors.hintdarkmode
                                          : AppColors.hintlightmode,
                                              fontSize: 15,
                                              fontFamily: "bold"
                                          ),
                                          // isExpanded: true,
                                          icon: const Icon(Icons.arrow_drop_down),
                                          items: value.categories.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (newvalue){
                                            value.change_selected(newvalue);

                                          }
                                        )),
                                  ),

                          SizedBox(height: 10,),
                          InkWell(
                            onTap: ()async{
                            DateTime? dattime = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2023),
                                lastDate: DateTime.now());
                            if(dattime != null){
                              items.chage_datime(dattime);
                            }
                            },
                            child: CustomCardWidget(
                                icon: Icon(Icons.calendar_month_outlined),
                                child: Text(
                                  "${items.datTime?.day.toString()}/${items.datTime?.month.toString()}/${items.datTime?.year.toString()}"
                                    ,style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColors.hintdarkmode
                                        : AppColors.hintlightmode,
                                    fontSize: 15,
                                    fontFamily: "bold"

                                ),)
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
                actions: [
                  UiHelpers.Customtextbutton(buttonanme: "Cancel",
                      callback: (){
                    Navigator.pop(rootContext);
                      }),
                  SizedBox(width: 10,),
                  UiHelpers.Customtextbutton(
                    buttonanme: "Add",
                    callback: () {
                      if (_formkey.currentState!.validate()) {
                        if (value.productimage == null || value.productimage!.path.isEmpty || value.selectedCategory == null) {
                          ScaffoldMessenger.of(rootContext).showSnackBar(
                            SnackBar(content: Text("Please fill all the blanks, including selecting an image and category.")),
                          );
                          return;
                        }

                        final profilebox = Boxes.profiledata();
                        final listdata = profilebox.values.toList().cast<ProfileModel>();
                        ProfileModel? foundProfile;

                        for (var i in listdata) {
                          if (i.email == emailcontroller.text.trim()) {
                            foundProfile = i;
                            break;
                          }
                        }

                        if (foundProfile != null) {

                          final data = ProductModels(
                            name: foundProfile.username,
                            email: foundProfile.email,
                            image: foundProfile.image,
                            number: foundProfile.number,
                            productname: productnamecontroller.text.trim(),
                            description: productdescriptioncontroller.text.trim(),
                            productprice: pricecontroller.text.trim(),
                            productlocation: locationcontroller.text.trim(),
                            productiamge: value.productimage!.path,
                            categry: value.selectedCategory!,
                            dateTime: items.datTime,
                          );

                          final productbox = Boxes.productdata();
                          productbox.add(data);
                          data.save();

                          // Clear controllers and providers
                          emailcontroller.clear();
                          productnamecontroller.clear();
                          productdescriptioncontroller.clear();
                          locationcontroller.clear();
                          pricecontroller.clear();
                          value.resetproductimage();
                          items.resetdate();


                          ScaffoldMessenger.of(rootContext).showSnackBar(
                            SnackBar(content: Text("Product Added Successfully!")),
                          );

                          Navigator.pop(rootContext); // close dialog ✅
                        } else {
                          ScaffoldMessenger.of(rootContext).showSnackBar(
                            SnackBar(content: Text("No account found for this email. Please create an account first.")),
                          );
                          // Don't close dialog
                        }
                      }
                    },
                  )

                ],
              ),
            ),
          );
        });
  }

}

class CustomCardWidget extends StatelessWidget {
   CustomCardWidget({super.key,required this.child,required this.icon});

  Widget child;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 55,
      child: Card(
        elevation: 10,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.textfielddarkmode
            : AppColors.txtfieldlightmode,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              icon,
              SizedBox(width: 10,),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

