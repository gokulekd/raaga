import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHighlightChanged: (value) {
          setState(() {
            isTapped = value;
          });
        },
        onTap: () {
          print("tapped");
        },
        child: AnimatedContainer(
          
          duration: Duration(milliseconds: 100),
          curve: Curves.fastLinearToSlowEaseIn,
          height: isTapped ? 45 : 50,
          width: isTapped ? 45 : 50,
          decoration: BoxDecoration(
            
            color:isTapped? Color.fromARGB(255, 119, 65, 138):Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 30,
                offset: Offset(3, 7),
              ),
            ],
          ),
          child: Center(
            child:Icon(Icons.arrow_forward_ios)
          ),
        ),
      ),
    );
  }
}
