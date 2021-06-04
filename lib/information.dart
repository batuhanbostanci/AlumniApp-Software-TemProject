import 'dart:io';
import 'dart:typed_data';
import 'package:alumnisoftwareapp/login.dart';
import 'package:alumnisoftwareapp/mainPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalInformationPage extends StatefulWidget {
  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  TextEditingController dateControl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String job;
  String location;
  String degree;
  String graduationDate;
  String cv;

  @override
  Widget build(BuildContext context) {






    DateTime now = DateTime.now();
    DateTime tenYearsAgo = DateTime(now.year - 10);
    DateTime afterTime = DateTime(
      now.year,
      now.month,
      now.day + 20,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          formKey.currentState.save();

          await FirebaseFirestore.instance.collection("profileInfo").add({
            "job": job,
            "graduationDate" : graduationDate,
            "location": location,
            "degree": degree,
            "E-mail": LoginPage.trans_Email,
          });

        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: SingleChildScrollView(
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
                        job = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.work_outline_outlined),
                        labelText: "Job",
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
                      onSaved: (value) {
                        location = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.location_on_outlined),
                        labelText: "Location",
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
                        degree = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.school_outlined),
                        labelText: "Degree",
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
                      controller: dateControl,
                      onSaved: (value) {
                        graduationDate = value;
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            {
                              showDatePicker(
                                      context: context,
                                      initialDate: now,
                                      firstDate: tenYearsAgo,
                                      lastDate: afterTime)
                                  .then((date) {
                                dateControl.text =
                                    formatDate(date, [dd, "/", mm, "/", yyyy]);
                              });
                            }
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.date_range),
                        labelText: "Date",
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
                        cv = value;
                      },
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        hintText: "Upload url of your CV",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.work_outline_outlined),
                        labelText: "CV",
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Or Upload your CV as a file",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () async {
                    FilePickerResult result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      Uint8List fileBytes = result.files.first.bytes;
                      String fileName = result.files.first.name;
                      print(fileName);
                    }
                  },
                  child: Text("Add CV")),
            ],
          ),
        ),
      ),
    );
  }
}
