import 'package:flutter/material.dart';

class createNewPlaylistButton extends StatefulWidget {
  const createNewPlaylistButton({ Key? key }) : super(key: key);

  @override
  State<createNewPlaylistButton> createState() => _createNewPlaylistButtonState();
}

class _createNewPlaylistButtonState extends State<createNewPlaylistButton> {

   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                      title: const Text(
                        'Add To Playlist',
                        textAlign: TextAlign.center,
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 150,
                        height: 80,
                      
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
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 54, 101, 244),
                  
                      ),
                    ),
                              
                                  hintText: "Enter Playlist Name"
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
                        ElevatedButton.icon(
                          style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    
    )
  )
),
                          
                          onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel), label: Text("cancel")),  
                     
                     
                        
                        ElevatedButton.icon(
                          style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
   
    )
  )
),
                          icon:Icon(Icons.library_music_outlined),
                          onPressed: () {

                            if (_formKey.currentState!.validate()) {
                              // text in form is valid
                            }
                          },
                          label: const Text('Create new Playlist'),
                        ),
                      ],
                    );
  }
}