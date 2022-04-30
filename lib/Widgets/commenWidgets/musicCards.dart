import 'package:flutter/material.dart';
import 'package:raaga/Widgets/commenWidgets/favouriteButton.dart';

class MusicCard extends StatefulWidget {
  const MusicCard({ Key? key }) : super(key: key);

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
    late Animation<double> _animation;
  late Animation<double> _animation2;

    
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
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
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                            'Example',
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
                            'Example',
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
                        )),
                    FavouriteButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}