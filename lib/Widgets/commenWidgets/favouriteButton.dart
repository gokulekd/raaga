import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({ Key? key }) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHighlightChanged: (value) {
          setState(() {
            isHighlighted = !isHighlighted;
          });
        },
        onTap: () {
          setState(() {
            isPressed2 = !isPressed2;
          });
        },
        child: AnimatedContainer(

          height: isHighlighted ? 30 : 25,
          width: isHighlighted ? 30: 25,
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
          child: isPressed2
              ? Icon(
                  Icons.favorite_border,size: 20,
                  color: Colors.black.withOpacity(0.6),
                )
              : Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 194, 61, 105).withOpacity(1.0),size: 20,
                ),
        ),
      );
    
  }
}
