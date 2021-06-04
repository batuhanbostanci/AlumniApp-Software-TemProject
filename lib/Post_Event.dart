import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:alumnisoftwareapp/widget/date_time_picker_widget2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Post_Event extends StatefulWidget {
  @override
  _Post_EventState createState() => _Post_EventState();
}

class _Post_EventState extends State<Post_Event> {
  String title;
  String desc1;
  String desc2;
  String date;
  String hour;
  //int alumniID;
  bool isValid;
  File _image;
  DateTime _dateTime;

//  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    isValid = false;
    // Firebase.initializeApp();
    super.initState();
  }

  _imgFromCamera() async {
    final picker = ImagePicker();
    final image =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image.path);
    });
  }

  _imgFromGallery() async {
    final picker = ImagePicker();
    final image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image.path);
      print("yazıdırılıyor: " + image.path.toString());
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post an event "),
        elevation: 0,
        //  automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            // backgroundColor: Colors.green,
            expandedHeight: MediaQuery.of(context).size.height * 1.8 / 10,
            primary: true,
            backgroundColor: Colors.transparent,

            flexibleSpace: Container(
                width: MediaQuery.of(context).size.width,
                height: 2501,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100)),
                ),
                child: FlexibleSpaceBar(
                  title: Text(
                    "Post an Event",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  centerTitle: true,
                )),

            pinned: true,
            floating: false,
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 1 / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.title),
                            labelText: "Title",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          maxLines: 5,
                          minLines: 1,

                          onSaved: (value) {
                            desc1 = value;
                          },
                          //obscureText: true,

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.description),
                            labelText: "Description",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 1.5 / 20,
                        //width: MediaQuery.of(context).size.width * 9 / 10,
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          maxLines: 5,
                          minLines: 1,

                          onSaved: (value) {
                            desc2 = value;
                          },

                          //keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.description_outlined),
                            labelText: "Details ",
                          ),
                        ),
                      ),
                    ),
                  ),
                  /* Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: TextFormField(

                              onTap: (){
                                _dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString();
                                showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2023)
                                ).then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });

                              },
                              onSaved: (value) {
                                date= value;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "date cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(Icons.date_range_outlined),
                                labelText: "Date",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        child: Text('Pick a date'),
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2023)
                          ).then((date) {
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        },
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Upload event photo!",style: TextStyle( fontWeight: FontWeight.bold),

                ),
                      SizedBox(
                        height: 10,
                      ),*/

                  /* Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Text(_dateTime == null ? 'date doesnt selected' : _dateTime.toString()),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              child: Text('Pick a date'),
                              onPressed: () async {
                                showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2023)
                                ).then((date) {
                                  setState(() {
                                    _dateTime = date;
                                  });
                                });
                              },
                            )
                          ],

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 20),
                        child: Column(
                          children: <Widget>[
                            Text(_hourtime == null ? 'date has been picked yet' : _hourtime.toString()),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              child: Text('Pick a date'),
                              onPressed: () {

                                showTimePicker(
                                    context: context,
                                    initialTime: _hourtime==null ? TimeOfDay.now(): _hourtime,
                                builder: (BuildContext context, Widget child) {
                                return Theme(
                                data: ThemeData.dark(),
                                child: child,
                                );
                                },).then((hour) {
                                          setState(() {
                                    _hourtime = hour ;
                                    print("seçilen saat:"+ hour.toString());
                                     });
                                });
                              },




                            )
                          ],

                        ),
                      ),*/
                  Center(
                    child: DateTimePickerWidget2(),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("printed here");
                      _showPicker(context);
                    },
                    child: Container(
                      //  radius: 55,
                      //  backgroundColor: Colors.teal,
                      child: _image != null
                          ? ClipRRect(
                              //borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                _image,
                                width: 300,
                                height: 200,
                                fit: BoxFit.fitHeight,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                // borderRadius: BorderRadius.circular(50)
                              ),
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: "Post",
                            child: ElevatedButton(
                              onPressed: () async {
                                /*  if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      print("trying to save to the firestore");

                                      /* var temp = await FirebaseFirestore.instance
                                          .collection('id')
                                          .get();
                                      temp.docs.forEach((doc) {
                                        if (doc["id"] == alumniID) {
                                          setState(() {
                                            isValid = true;
                                          });
                                        }
                                      }*/

                                      // );




                                      //These part for the adding firestore database. We can change our variables

                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .add({
                                        "name": name,
                                        "surname": surName,
                                        "password": password,
                                        "E-mail": mail,
                                      });
                                      print("saved to the firestore");
                                      //Navigator.pop(context);

                                    }*/
                              },
                              child: Text("Post"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
