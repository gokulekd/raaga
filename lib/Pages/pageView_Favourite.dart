import 'package:flutter/material.dart';

import 'package:raaga/Pages/pageView_myMusic.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';

import 'package:raaga/Widgets/favourite/playAll_Button.dart';
import 'package:raaga/Widgets/my%20music/myMusic_search.dart';

class pageView_Faourite extends StatefulWidget {
  const pageView_Faourite({Key? key}) : super(key: key);

  @override
  State<pageView_Faourite> createState() => _pageView_FaouriteState();
}

class _pageView_FaouriteState extends State<pageView_Faourite>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool ontap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(107, 129, 118, 118),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 103, 58, 183),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BottomNavigation()));
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp)),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 8),
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 94, 33, 168),
          ),
          child: Text(
            "favourites",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
   
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 25, bottom: 15, left: 15),
                    child: PlayAll_Button(
                        iconName1: Icons.play_circle_outline_outlined,
                        name: "Play All",
                        onTap: () {},
                        iconName2: Icons.play_circle_fill_sharp)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            cards(context, _animation, _animation2),
            cards(context, _animation, _animation2),
            cards(context, _animation, _animation2),
            cards(context, _animation, _animation2),
            cards(context, _animation, _animation2),
            cards(context, _animation, _animation2),
          ],
        ),
      ),
    );
  }
}
