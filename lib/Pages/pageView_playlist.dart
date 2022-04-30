import 'package:flutter/material.dart';
import 'package:raaga/Widgets/PlayLists/editButton.dart';

import 'package:raaga/Widgets/PlayLists/playListTIle.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:raaga/Widgets/favourite/playAll_Button.dart';

class pageview_Playlist extends StatefulWidget {
  const pageview_Playlist({ Key? key }) : super(key: key);

  @override
  State<pageview_Playlist> createState() => _pageview_PlaylistState();
}

class _pageview_PlaylistState extends State<pageview_Playlist> {
  @override
  Widget build(BuildContext context) {
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
            "Playlists",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(child: ListView(
        children: [
          Row(
            children: [

              Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15, left: 15),
                child: PlayAll_Button(iconName1: Icons.add_circle_outline ,name: "Add Playlist", onTap: (){
                  editPlaylist();
                }, iconName2: Icons.add_circle),
              ),
            ],
          ),
          playlistTile(iconName: Icons.favorite_rounded , PlaylistName: "Favourites", SongsNumber:"5 songs"),
           playlistTile(iconName: Icons.headphones , PlaylistName: "Favourites", SongsNumber:"5 songs"),
            playlistTile(iconName: Icons.library_music_sharp , PlaylistName: "Favourites", SongsNumber:"5 songs"),

        
        ],
        
      ),
      ),
    );
  }
}