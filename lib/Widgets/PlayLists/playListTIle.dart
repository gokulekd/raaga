

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:raaga/Widgets/PlayLists/playlist_SongView_page.dart';
class playlistTile extends StatefulWidget {
  IconData iconName;
  String PlaylistName;
 String SongsNumber;
   playlistTile({ Key? key,required this.iconName,required this.PlaylistName,required this.SongsNumber }) : super(key: key);

  @override
  State<playlistTile> createState() => _playlistTileState();
}

class _playlistTileState extends State<playlistTile> {
 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
             Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Playlist_SongView_page()));
      },
      child: Padding(
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
                            child: IconButton(onPressed: (){
    
    
                              showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Edit Playlist',
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                     fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 54, 101, 244),
                    
                        ),
                      ),
                                
                                    hintText: "Edit Playlist Name"
                                  ),
    
                                  
                                  validator: (value) {
                                    // validation logic
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // text in form is valid
                              }
                            },
                            child: const Text('Done'),
                          ),
                        ],
                      ),
                    );
    
    
    
                            }, icon: Icon(Icons.edit,color: Color.fromARGB(255, 128, 81, 81),size: 20,)),
                          ),
                          Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () {
    
                                
                              showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Delete Playlist',
                          textAlign: TextAlign.center,
                        ),
                        content:Text(" Do you want to Delete this playlist"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // text in form is valid
                              }
                            },
                            child: const Text('Done'),
                          ),
                        ],
                      ),
                    );
    
    
    
    
                        }, icon: Icon(Icons.delete),color: Color.fromARGB(255, 128, 81, 81),),
                  )
              ],
            ),
          ],
        ),
          
          
        ),
      ),
    );
  }
}

