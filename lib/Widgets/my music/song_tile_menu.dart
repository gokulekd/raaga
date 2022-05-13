import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:raaga/dataBase/songModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class song_tile_menu extends StatelessWidget {
    final String songId;
   song_tile_menu({ Key? key,required this.songId}) : super(key: key);

  final box = Raaga_SongData.getInstance();

  List<songDataBaseModel> dbSongs = [];
  List<Audio> fullSongs = [];

  @override
  Widget build(BuildContext context) {


    dbSongs = box.get("musics") as List<songDataBaseModel>;


    List? favourites = box.get("favourites");


    final temp = databaseSongs(dbSongs, songId);


    return PopupMenuButton(
      icon: FaIcon(FontAwesomeIcons.circleChevronDown,size: 17,color: Color.fromARGB(255, 207, 200, 222),),
      itemBuilder: (BuildContext context) => [
        favourites!.where((element) => element.id.toString() == temp.id.toString()).isEmpty
            ? PopupMenuItem(
                onTap: () async {
                  favourites.add(temp);
                  await box.put("favourites", favourites);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        temp.title  + " Added to Favourites",
                       
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Add to Favourite",
                 
                ),
              )
            : 
            PopupMenuItem(
                onTap: () async {
                  favourites.removeWhere(
                      (element) => element.id.toString() == temp.id.toString());
                  await box.put("favourites", favourites);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        temp.title+ " Removed from Favourites",
                        style: const TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Remove From Favourite",
                
                ),
              ),
        const PopupMenuItem(
          child: Text(
            "Add to Playlist",
    
          ),
          value: "1",
        ),
      ],
      onSelected: (value) async {
        if (value == "1") {
         Navigator.canPop(context);
        }
      },
    );
  }

  songDataBaseModel databaseSongs(List<songDataBaseModel> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }
}
