

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
class playlistTile extends StatefulWidget {
  IconData iconName;
  String PlaylistName;
 String SongsNumber;
   playlistTile({ Key? key,required this.iconName,required this.PlaylistName,required this.SongsNumber }) : super(key: key);

  @override
  State<playlistTile> createState() => _playlistTileState();
}

class _playlistTileState extends State<playlistTile> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           color: Color.fromARGB(255, 210, 189, 229),
        ),height: 97,
        width: 320,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              decoration: BoxDecoration(
                color: Color.fromARGB(255, 189, 139, 191),
                     borderRadius: BorderRadius.circular(15),
                   
              ),
              
              width: 70,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:Icon(widget.iconName,size: 40,color: Color.fromARGB(255, 148, 78, 73),),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
                  SizedBox(
                  height: 12,
                   ),
                      Container(
                        height: 30,
                        width: 220,
                       
                        child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5,left: 5),
                            child: Icon(
                              Icons.my_library_music_rounded,
                              size: 17,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                           Text(
                        widget.PlaylistName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(194, 171, 94, 219),
                          fontSize: 18,
                        ),
                    ),

                        ],
                    ),
                      ),

                    SizedBox(height: 10,),
                    Container(
                         height: 30,
                  width: 220,
                   
                      child: Row(
                        children: [
                          Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Icon(
                         Icons.music_note,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.SongsNumber,
                            style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold,
                              color: Color.fromARGB(59, 26, 6, 6).withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    )
           ], 
          ),
          Column(
          
            children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Color.fromARGB(255, 128, 81, 81),size: 20,)),
                        ),
                        Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.delete),color: Color.fromARGB(255, 128, 81, 81),),
                )
            ],
          ),
        ],
      ),
        
        
      ),
    );
  }
}

