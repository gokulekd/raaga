import 'package:flutter/material.dart';
import 'package:raaga/Widgets/bottomsheet_playmusic/playbutton_bottomSheet.dart';
import 'package:raaga/Widgets/commenWidgets/favouriteButton.dart';
import 'package:raaga/Widgets/musicPlayPage/addToPlayList.dart';
import 'package:raaga/Widgets/musicPlayPage/shuffleSongs.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
class musicPlay_pageView extends StatefulWidget {
  const musicPlay_pageView({Key? key}) : super(key: key);

  @override
  State<musicPlay_pageView> createState() => _musicPlay_pageViewState();
}

class _musicPlay_pageViewState extends State<musicPlay_pageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 103, 58, 183),
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_down_sharp),
        ),
        backgroundColor: Color.fromARGB(255, 103, 58, 183),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Now Playing",
              style: TextStyle(
                  color: Color.fromARGB(116, 255, 255, 255), fontSize: 18),
            ),
            Text(
              "Tylor Swift - Black Space -youtube",
              style: TextStyle(
                  color: Color.fromARGB(255, 233, 233, 233), fontSize: 20),
            ),
            Text(
              "Artist - tylor Swift",
              style: TextStyle(
                  color: Color.fromARGB(116, 255, 255, 255), fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.ios_share_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20
                ),
                width: 340,
                height: 360,
                
                decoration:BoxDecoration(
            
                  borderRadius: BorderRadius.circular(10)
                ) ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/logo8.jpg',fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               FavouriteButton(),
          shuffleSongs_musicPlayPage(),
               addToPlayList(),

              ],
            ),
            SizedBox(height: 30,),
Padding(
  padding: const EdgeInsets.all(15.0),
  child:   ProgressBar(
  
    progressBarColor: Color.fromARGB(255, 255, 255, 255),
  
                baseBarColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.24),
        
       
  
                thumbColor: Color.fromARGB(255, 164, 116, 220),
  
                barHeight: 5.0,
  
                thumbRadius: 12.0,
  
                progress: Duration(milliseconds: 1000),
  
            
  
                total: Duration(milliseconds: 5000),
  
                onSeek: (duration) {
  
                  print('User selected a new time: $duration');
  
                },
  
              ),
),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
   
         IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_rounded)),
       playButton_bottomSheet(),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined)),
  ],
),
          ],
          

        ),
      ),
    );
  }
}
