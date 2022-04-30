import 'package:flutter/material.dart';
import 'package:raaga/Widgets/musicPlayPage/pageView_musicPlay.dart';
import 'package:raaga/Widgets/bottomsheet_playmusic/nextButton_bottomSheet.dart';
import 'package:raaga/Widgets/bottomsheet_playmusic/playbutton_bottomSheet.dart';
import 'package:raaga/Widgets/commenWidgets/favouriteButton.dart';

class bottomsheet_musicPlay extends StatefulWidget {
  const bottomsheet_musicPlay({ Key? key }) : super(key: key);

  @override
  State<bottomsheet_musicPlay> createState() => _bottomsheet_musicPlayState();
}

class _bottomsheet_musicPlayState extends State<bottomsheet_musicPlay> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => musicPlay_pageView()));
        
      },

      child: Container(
        color: Color.fromARGB(255, 182, 132, 192),
        width: double.infinity,
        height: 90,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.all(5),
             decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(10),
           
             ),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: Image.asset('assets/logo6.jpg',fit: BoxFit.cover,),
             ),
            ),
    playButton_bottomSheet(),
    Column(
      children: [
    
            Row(
              children: [
                Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Icon(
                        Icons.music_note,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      
                         padding: const EdgeInsets.only(top: 15,left: 5),
                      child: Text("hello",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ],
            ),
             Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Icon(
                        Icons.album,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 15, left: 5),
                        child: Text(
                          "hello",
                          style: TextStyle(
                              fontSize: 18, ),
                        )),
                  ],
                ),
      ],
    ),
    MyCustomWidget(),
          ],
        ),
      ),
    );
  }
}