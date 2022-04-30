import 'package:flutter/material.dart';

class playButton_bottomSheet extends StatefulWidget {
  const playButton_bottomSheet({Key? key}) : super(key: key);

  @override
  State<playButton_bottomSheet> createState() => _playButton_bottomSheetState();
}

class _playButton_bottomSheetState extends State<playButton_bottomSheet> {
  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
        child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: AnimatedContainer(
              height: 50,
              width: 50,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isPressed ? 0.2 : 0.0),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: isPressed ? Colors.white : Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(isPressed?Icons.play_arrow:Icons.pause,size: 30,),
              
               
              ),
            ),
          
        ],
      ),
    ),
    );
  }
}
