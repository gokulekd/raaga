import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:raaga/Pages/pageView_myMusic.dart';
import 'package:raaga/Widgets/PlayLists/createNewPlayList.dart';
import 'package:raaga/Widgets/bottomNavBar/BottomNavbar.dart';
import 'package:raaga/Widgets/commenWidgets/favouriteButton.dart';

import 'package:raaga/Widgets/favourite/playAll_Button.dart';
import 'package:raaga/Widgets/musicPlayPage/openPlayer.dart';
import 'package:raaga/Widgets/my%20music/myMusic_search.dart';
import 'package:raaga/Widgets/my%20music/song_tile_menu.dart';
import 'package:raaga/dataBase/songModel.dart';

class pageView_Faourite extends StatefulWidget {
  pageView_Faourite({Key? key}) : super(key: key);

  @override
  State<pageView_Faourite> createState() => _pageView_FaouriteState();
}

class _pageView_FaouriteState extends State<pageView_Faourite>
    with SingleTickerProviderStateMixin {
  List<songDataBaseModel>? dbSongs = [];
  List<Audio> playLiked = [];
  final box = Raaga_SongData.getInstance();

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;
  final _audioQuery = OnAudioQuery();
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
    double _w = MediaQuery.of(context).size.width;
    final favSongs = box.get("favourites");

    return Scaffold(
 backgroundColor:Color(0xff262054),
      appBar: AppBar(
        toolbarHeight: 80,
         backgroundColor:Color(0xff262054),
      
        title: Container(
        
          padding: EdgeInsets.only(top: 8),
          width: 380,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 109, 77, 147),
          ),
          child: Text(
            "favourites",style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 20,
      ),
      body: SafeArea(
        child: ListView.builder(
          
           padding: EdgeInsets.only(bottom: 80,top: 10),
            itemCount: favSongs!.length,
            itemBuilder: (context, index) {
              return Opacity(
                opacity: _animation.value,
                child: InkWell(
                  enableFeedback: true,
                  onTap: () async {
                    print("hai");

              for (var element in favSongs) {
                      playLiked.add(
                        Audio.file(
                          element.uri!,
                          metas: Metas(
                            title: element.title,
                            id: element.id.toString(),
                            artist: element.artist,
                          ),
                        ),
                      );
                    }
                    OpenPlayer(fullSongs: playLiked, index: index)
                        .openAssetPlayer(index: index, songs: playLiked);
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                   margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                
                    height: _w / 4.5,
                    width: _w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 71, 64, 131),
                       borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 55.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: QueryArtworkWidget(
                                nullArtworkWidget: Image.asset(
                                  "assets/songs logo.png",
                                  fit: BoxFit.cover,
                                ),
                                id: favSongs[index].id,
                                artworkBorder: BorderRadius.circular(5.0),
                                type: ArtworkType.AUDIO),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.music_note,
                                    size: 17,
                                    color: Color.fromARGB(207, 215, 210, 225),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 4),
                                    width: 185.w,
                                    height: 25.h,
                                    child: Marquee(
                                      velocity: 20,
                                      text: favSongs[index].title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(207, 215, 210, 225),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.album,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: REdgeInsets.only(right: 4),
                                    width: 185.w,
                                    height: 18.h,
                                    child: Text(
                                      favSongs[index].artist.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                         color: Color.fromARGB(157, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.abc)),
                      ],
                    ),
                  ),
                ),
              );

              padding:
              EdgeInsets.only(bottom: 80);
            }),
      ),
    );
  }
}
