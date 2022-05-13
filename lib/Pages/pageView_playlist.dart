import 'package:flutter/material.dart';
import 'package:raaga/Widgets/PlayLists/createNewPlayList.dart';
import 'package:raaga/Widgets/PlayLists/createNewPlaylistButton.dart';
import 'package:raaga/Widgets/PlayLists/editButton.dart';

import 'package:raaga/Widgets/PlayLists/playListTIle.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:raaga/Widgets/bottomsheet_playmusic/nextButton_SongPlay.dart';
import 'package:raaga/Widgets/favourite/playAll_Button.dart';

class pageview_Playlist extends StatefulWidget {
  const pageview_Playlist({Key? key}) : super(key: key);

  @override
  State<pageview_Playlist> createState() => _pageview_PlaylistState();
}

class _pageview_PlaylistState extends State<pageview_Playlist>
    with TickerProviderStateMixin {
 
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 103, 58, 183),
      
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
            "Playlists",
            textAlign: TextAlign.center,
          ),
        ),
      ),


      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onHighlightChanged: (value) {
                  setState(() {
                    isTapped = value;
                  });
                },
                onTap: () {

                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>createNewPlaylistButton()
                     
                  );




                },
                child: AnimatedContainer(
                  
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: isTapped ? 30 : 40,
                  width: isTapped ? 190 : 200,
                  
                  decoration: BoxDecoration(
                    color: isTapped
                        ? Color.fromARGB(255, 171, 124, 179)
                        : Color.fromARGB(255, 212, 177, 222),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        offset: Offset(3, 7),
                      ),
                    ],
                  ),
                   child: Center(child: Text("Create New Playlist",style: TextStyle(color: Color.fromARGB(255, 86, 42, 118),fontSize: 18,fontWeight: FontWeight.bold),),),
                
                  
                ),
              ),
              
            ),
          Expanded(child: 
          ListView.builder(itemBuilder: (context, index){
            
            return playlistTile(iconName: Icons.abc, PlaylistName: 'PlaylistName', SongsNumber: 'SongsNumber');
          },
          itemCount: 6,
          padding: EdgeInsets.only(bottom: 80),
          ),
          
          ),
       
          ],
        
        ),
        
      
      ),
    );
  }
}
