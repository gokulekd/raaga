import 'package:flutter/material.dart';
import 'package:raaga/Widgets/musicPlayPage/pageView_musicPlay.dart';
import 'package:raaga/Pages/pageView_myMusic.dart';
import 'package:raaga/Widgets/albums/albumTile.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:raaga/Widgets/favourite/playAll_Button.dart';

class pageView_Albums extends StatefulWidget {
  const pageView_Albums({Key? key}) : super(key: key);

  @override
  State<pageView_Albums> createState() => _pageView_AlbumsState();
}

class _pageView_AlbumsState extends State<pageView_Albums> {

 
  @override
  Widget build(BuildContext context) {
         double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
            "albums",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
     child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
         
                childAspectRatio: width / (height /1.6)),
            itemBuilder: (BuildContext context, int index) {
              return albumTile();
            }),
      ),
    );
  }
}
