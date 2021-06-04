import 'dart:math';
import 'package:alumnisoftwareapp/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'alumni_database.dart';
import 'package:alumnisoftwareapp/user.dart';
import 'package:alumnisoftwareapp/alumni_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String mail;
  String password;
  String name;
  String surName;
  int alumniID;
  bool isValid;

  var formKey = GlobalKey<FormState>();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    isValid = false;
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future<void> imageContentNotifications() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'media channel id 1',
      'media channel name 1',
      'media channel description 1',
      color: Colors.teal,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap("etumed"),
      styleInformation: MediaStyleInformation(),
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(0, 'Succesfully Registered',
        'Now you can Login!', platformChannelSpecifics,
        payload: "Image with Content Notifications");
  }

  Future<void> cancelNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
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
                    "Register",
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
                        // height: MediaQuery.of(context).size.height * 1.5 / 20,
                        //width: MediaQuery.of(context).size.width * 9 / 10,
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            name = value;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Name can not be empty !";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.text_fields),
                            labelText: "Name",
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
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            surName = value;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Surname can not be empty !";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.text_fields),
                            labelText: "Surname",
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
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            password = value;
                          },
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String s) {
                            if (!s.contains(RegExp(r'[A-Z]'))) {
                              return "Use upper case character!";
                            } else if (!s.contains(RegExp(r'[a-z]'))) {
                              return "Use lower case character!";
                            } else if (!s.contains(RegExp(r'[0-9]'))) {
                              return "Use number!";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
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
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            mail = value;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _emailCheck,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.mail),
                            labelText: "Email",
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
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            alumniID = int.parse(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //validator: _emailCheck,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.school),
                            labelText: "Alumni ID",
                          ),
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
                            tag: "register",
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  var temp = await FirebaseFirestore.instance
                                      .collection('id')
                                      .get();

                                  temp.docs.forEach((doc) {
                                    if (doc["id"] == alumniID) {
                                      setState(() {
                                        isValid = true;
                                      });
                                    }
                                  });

                                  if (isValid == true) {
                                    try {
                                      //authentication part. it directly goes into authentication part
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                        email: mail,
                                        password: password,
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      //These are showing as a warning on the page Remainder!!
                                      //I added this part into database because we need to take these informations
                                      //then, we are goona put into profile page
                                      if (e.code == 'weak-password') {
                                        print(
                                            'The password provided is too weak.');
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        print(
                                            'The account already exists for that email.');
                                      }
                                    } catch (e) {
                                      print(e);
                                    }

                                    //These part for the adding firestore database. We can change our variables
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .add({
                                      "name": name,
                                      "surname": surName,
                                      "password": password,
                                      "E-mail": mail,
                                    });
                                    print("added into server");
                                    // Notification part
                                    imageContentNotifications();
                                    Navigator.pop(context);
                                  } else {
                                    showMessage(
                                        "Your id number isn't correct!");
                                  }
                                }
                              },
                              child: Text("Register"),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already a member?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.teal),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Future addUser() async {
    final user = AlumniUser(
      firstName: name,
      lastName: surName,
      jobTitle: null,
      address: null,
      isAlumni: true,
      registrationDate: DateTime.now(),
      email: null,
    );

    await AlumniDatabase.instance.create(user);
  }

  String _emailCheck(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Check your mail !';
    else
      return null;
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.red,
      fontSize: 16.0);
}

//Random Generator Code for the ID's
String randomIDGenerator() {
  var rand = Random();
  int length = 21;
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(length, (index) => _chars[rand.nextInt(_chars.length)])
      .join();
}
