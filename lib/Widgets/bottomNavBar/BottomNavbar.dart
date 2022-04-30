import 'package:flutter/material.dart';
import 'package:raaga/Pages/pageView_Albums.dart';
import 'package:raaga/Pages/pageView_Favourite.dart';
import 'package:raaga/Pages/pageView_myMusic.dart';
import 'package:raaga/Pages/pageView_playlist.dart';
import 'package:raaga/Widgets/bottomsheet_playmusic/bottomsheet.dart';
import 'package:raaga/Widgets/my%20music/drawer/drawer_Raaga.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndexState = 0;

  // ignore: non_constant_identifier_names
  final _Pages = [
  Screen_MyMusic(),
  //  pageView_Faourite(),
 pageView_Faourite(),
    pageView_Albums(),
    pageview_Playlist(),
    

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

 
   drawer: drawer_Raaga(),
      body: _Pages[_currentIndexState],
     bottomSheet: bottomsheet_musicPlay(),
      bottomNavigationBar: Theme(
         data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Color.fromARGB(255, 198, 170, 204),
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
      
   
            ), 
        child: BottomNavigationBar(         // fixedColor: Colors.red,
       
            currentIndex: _currentIndexState,
            onTap: (newindex) {
              setState(() {
                _currentIndexState = newindex;
              });
            },
            selectedItemColor:Color.fromARGB(255, 255, 255, 255),
            unselectedItemColor:Color.fromARGB(255, 145, 90, 208),
            items: const [
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 35,
                    child: Icon(
                      Icons.headphones_rounded,
                      size: 30,
                    ),
                  ),
                  label: "MyMusic"),
                  
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 30,
                  ),
                  label: "Favourite"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.album,
                    size: 30,
                  ),
                  label: "Albums"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.queue_music_sharp,
                    size: 30,
                  ),
                  label: "playlist"),
         
            ]),
      ),
    );
  }
}
