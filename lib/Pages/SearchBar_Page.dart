import 'package:flutter/material.dart';
import 'package:raaga/Widgets/musicPlayPage/pageView_musicPlay.dart';
import 'package:raaga/Pages/pageView_myMusic.dart';
import 'package:raaga/Widgets/albums/albumTile.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:raaga/Widgets/favourite/playAll_Button.dart';
import 'package:raaga/Widgets/my%20music/myMusic_search.dart';

class SearchBar_Page extends StatefulWidget {
  const SearchBar_Page({Key? key}) : super(key: key);

  @override
  State<SearchBar_Page> createState() => _SearchBar_PageState();
}

class _SearchBar_PageState extends State<SearchBar_Page> {

 
  @override
  Widget build(BuildContext context) {
   
    var Query = " ";
    return Scaffold(
           backgroundColor:Color(0xff262054),
      appBar: AppBar(
        toolbarHeight: 80,
             backgroundColor:Color(0xff262054),

     
     
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
      body:searchBar_Mymusic(
                text: Query, onChanged: searchSongs, hintText: "Search Songs"),

   
      
    );
  }
}
var searchsongs;
void searchSongs(String Query) {
    // List<Audio> searchTitle = allSongs.where((element) {
    //     return element.metas.title!.toLowerCase().startsWith(
    //           search.toLowerCase(),
    //         );
    //   }).toList();

    //   final books = allBooks.where((book) {
    //     final titleLower = book.title.toLowerCase();
    //     final authorLower = book.author.toLowerCase();
    //     final searchLower = query.toLowerCase();

    //     return titleLower.contains(searchLower) ||
    //         authorLower.contains(searchLower);
    //   }).toList();

    //   setState(() {
    //     this.query = query;
    //     this.books = books;
    //   });
  }