import 'package:flutter/material.dart';

// ignore: camel_case_types
class shuffleSongs_musicPlayPage extends StatefulWidget {
  const shuffleSongs_musicPlayPage({Key? key}) : super(key: key);

  @override
  _shuffleSongs_musicPlayPageState createState() => _shuffleSongs_musicPlayPageState();
}

class _shuffleSongs_musicPlayPageState extends State<shuffleSongs_musicPlayPage>
    with TickerProviderStateMixin {
  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
        height: isHighlighted ? 35 : 25,
        width: isHighlighted ? 35 : 25,
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
                Icons.loop,
                color: Colors.black.withOpacity(0.6),
              )
            : Icon(
                Icons.shuffle,
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              ),
      ),
    );
  }
}
