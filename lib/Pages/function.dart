  import 'package:flutter/material.dart';
import 'package:raaga/Pages/Screen_Splash.dart';

Widget buildMenuItem({required String name, 
  required IconData IconName,
  VoidCallback? onClicked,
  })
  
   {
    final itemcolor = Color.fromARGB(255, 165, 35, 35);
    return ListTile(
      leading: Icon(
        IconName,
        color: itemcolor,size: 28,
      ),
      title: Text(
        name,
        style: TextStyle(color: itemcolor,fontSize: 15),
      ),
      onTap: onClicked,
    );
  }



  void selectedItem(BuildContext,int index){


    switch(index){
      case 0:

 
    }
  }