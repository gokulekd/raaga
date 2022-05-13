import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:raaga/Pages/Screen_Splash.dart';

import 'package:raaga/Widgets/commenWidgets/favouriteButton.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:raaga/Widgets/musicPlayPage/openPlayer.dart';
import 'package:raaga/Widgets/my%20music/drawer/drawer_Raaga.dart';
import 'package:raaga/Widgets/my%20music/myMusic_search.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:raaga/Widgets/my%20music/song_tile_menu.dart';


final _audioQuery = new OnAudioQuery();

class Screen_MyMusic extends StatefulWidget {
  List<Audio> Fullsongs = [];

  Screen_MyMusic({Key? key, required this.Fullsongs}) : super(key: key);

  @override
  Screen_MyMusicState createState() => Screen_MyMusicState();
}

class Screen_MyMusicState extends State<Screen_MyMusic>
    with SingleTickerProviderStateMixin {
  String Query = " ";
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  //  final box = Raaga_SongData.getInstance();
  final AssetsAudioPlayer player = AssetsAudioPlayer.withId("0");
  final _audioQuery = OnAudioQuery();

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

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

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Color(0xff262054),
      appBar: AppBar(
      
        backgroundColor:Color(0xff262054),
        elevation: 10,
        title: Text('RAAGA'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu)),
      ),
      drawer: drawer_Raaga(),

      body: SafeArea(

        
        child: FutureBuilder<List<SongModel>>(
          future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true,
          ),
          builder: (context, item) {
            if (item.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (item.data!.isEmpty) {
              return Center(
                child: Text(" No Songs Found"),
              );
            }
            return ListView.builder(
              itemCount: item.data!.length,
              itemBuilder: (context, index) =>
               InkWell(
                 enableFeedback: true,
                 onTap: () async {
            

                   await OpenPlayer(fullSongs: fullSongs, index: index)
                       .openAssetPlayer(index: index, songs: widget.Fullsongs);
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
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                               id: item.data![index].id,
                               artworkBorder: BorderRadius.circular(5.0),
                               type: ArtworkType.AUDIO),
                         ),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                     text: item.data![index].displayNameWOExt,
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
                                   color:  Color.fromARGB(207, 215, 210, 225),
                                 ),
                               ),
                               Center(
                                 child: Container(
                                   margin: REdgeInsets.only(right: 4),
                                   width: 185.w,
                                   height: 18.h,
                                   child: Text(
                                     item.data![index].artist.toString(),
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
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                        
                           song_tile_menu(songId: widget.Fullsongs[index].metas.id.toString()),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
              padding: EdgeInsets.only(bottom: 80,top: 8),
            );
          },
        ),
      ),

      // top me rahna
    );
  }

  void searchSongs(String query) {
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
}

Widget cards(BuildContext context, Animation<double> _animation,
    Animation<double> _animation2) {
  double _w = MediaQuery.of(context).size.width;
  return FutureBuilder<List<SongModel>>(
    future: _audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    ),
    builder: (context, item) {
      if (item.data == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (item.data!.isEmpty) {
        return Center(
          child: Text(" No Songs Found"),
        );
      }
      return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, _animation2.value),
            child: InkWell(
              enableFeedback: true,
              onTap: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.fromLTRB(_w / 30, _w / 30, _w / 30, 0),
                height: _w / 3.9,
                width: _w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffB993CB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/logo12.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: _w / 2.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.music_note,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                item.data![index].displayNameWOExt,
                                textScaleFactor: 1.6,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(.7),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.album,
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${item.data![index].genre}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(.8),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                          ),
                        ),
                        FavouriteButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .1, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .9, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);

    Paint paint_2 = Paint()
      ..color = Colors.deepPurple
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
