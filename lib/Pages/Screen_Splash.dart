
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class screen_splashScreen extends StatefulWidget {
  const screen_splashScreen({ Key? key }) : super(key: key);

  @override
  State<screen_splashScreen> createState() => _screen_splashScreenState();
}

class _screen_splashScreenState extends State<screen_splashScreen> {

  bool _a = false;

  @override
  void initState() {



    super.initState();
  
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context)
          .pushReplacement(SlideTransitionAnimation(BottomNavigation()));
    });


 requstPermission();
  }
      requstPermission() {
    Permission.storage.request();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
    
          AnimatedContainer(
            duration: Duration(milliseconds: 0),
            curve: Curves.fastLinearToSlowEaseIn,
       width: 393.w,
            height:810.h,
            color: Colors.deepPurple,
          ),
          Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Text(
                'Raaga',
                style: TextStyle(
                  fontFamily: 'font1',
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Play Your Favourite Tunes',
                style: TextStyle(
                  fontFamily: 'font1',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
      
                child: Container(
           
                  width: double.infinity, 
                  height:425.5.h,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: Image.asset(
                      "assets/logo9.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.ltr,
                child: page,
              );
            });
}
