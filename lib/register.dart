import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController mailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  TextEditingController nameControl = new TextEditingController();
  TextEditingController surnameControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: TextField(
                  controller: nameControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                //padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: TextField(
                  controller: surnameControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Surname',
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                //padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: TextField(
                  controller: passwordControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.vpn_key),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: TextField(
                  controller: mailControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: ElevatedButton.icon(
                      label: Text("Register"),
                      icon: Icon(Icons.app_registration),
                      onPressed: () async {
                        try {
                          //authentication part. it directly goes into authentication part
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: mailControl.text,
                            password: passwordControl.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          //These are showing as a warning on the page Remainder!!
                          //I added this part into database because we need to take these informations
                          //then, we are goona put into profile page
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        //These part for the adding firestore database. We can change our variables
                        await FirebaseFirestore.instance
                            .collection("users")
                            .add({
                          "name": nameControl.text,
                          "surname": surnameControl.text,
                          "password": passwordControl.text,
                          "E-mail": mailControl.text,
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
