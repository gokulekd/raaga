import 'package:flutter/material.dart';
import 'package:raaga/Pages/Screen_Splash.dart';
import 'package:raaga/dataBase/songModel.dart';

class FavouriteButton extends StatefulWidget {
  final String AddFAVid;
  FavouriteButton({Key? key, required this.AddFAVid}) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  final box = Raaga_SongData.getInstance();

  bool istapped = true;

 

  List<songDataBaseModel> full_dataBase_Songs = [];

  @override
  Widget build(BuildContext context) {
    List? favourites_main_List = box.get("favourites");

    full_dataBase_Songs = box.get("musics") as List<songDataBaseModel>;
    final temp = databaseSongs(full_dataBase_Songs, widget.AddFAVid);
    return
    
     InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
         istapped = ! istapped;
        });
      },
   
      child: AnimatedContainer(
        height: istapped ? 35 : 30,
        width:  istapped ? 35 : 30,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: Offset(5, 10),
            ),
          ],
          color: Color.fromARGB(255, 210, 189, 229),
          shape: BoxShape.circle,
        ),
        child:  istapped 
            ? Icon(
                Icons.favorite_border,
                size: 20,
                color: Colors.black.withOpacity(0.6),
              )
            : Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 194, 61, 105).withOpacity(1.0),
                size: 20,
              ),
      ),
         onTap: () {
        var snackBar = SnackBar(
            behavior: SnackBarBehavior.fixed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            backgroundColor: Color.fromARGB(255, 42, 41, 123),
            duration: Duration(seconds: 1),
            content: istapped
                ? Text('Added to Favourite')
                : Text("removed to Favourite")
                
                );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
               
                
        setState(() {
          istapped = !istapped;

         
        });
      },
    );
  }

  songDataBaseModel databaseSongs(List<songDataBaseModel> songs, String id) {
    return songs.firstWhere(
      (element) => element.id.toString().contains(id),
    );
  }
}
