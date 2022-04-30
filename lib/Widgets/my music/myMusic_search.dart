

import 'package:flutter/material.dart';

class searchBar_Mymusic extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;


const searchBar_Mymusic({

    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
    

}) :super(key: key);
 


  @override
  State<searchBar_Mymusic> createState() => _searchBar_MymusicState();
}

class _searchBar_MymusicState extends State<searchBar_Mymusic> {
    final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      
      height: 35,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromARGB(201, 227, 193, 215),
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.only(left: 10,top: 1),
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color,size: 25,),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle:TextStyle(
            
            fontSize: 15,
          ),
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
