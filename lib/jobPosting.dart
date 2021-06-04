import 'package:alumnisoftwareapp/login.dart';
import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobPostingPage extends StatefulWidget {
  @override
  _JobPostingPageState createState() => _JobPostingPageState();
}

class _JobPostingPageState extends State<JobPostingPage> {
  var formKey = GlobalKey<FormState>();
  String position;
  String location;
  String jobDescription;
  String dropDownValue = "Internship";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Job Posting"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 6 / 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          onSaved: (value) {
                            position = value;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.work_outline_outlined),
                            labelText: "Position",
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
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
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          maxLines: 3,
                          onSaved: (value) {
                            jobDescription = value;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: Icon(Icons.description_outlined),
                            labelText: "Job Description",
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Manner of Work",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        DropdownButton(
                            value: dropDownValue,
                            onChanged: (value) {
                              setState(() {
                                dropDownValue = value;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  value: "Internship",
                                  child: Text("Internship")),
                              DropdownMenuItem(
                                  value: "Long Term", child: Text("Long Term")),
                              DropdownMenuItem(
                                  value: "Part Time", child: Text("Part Time")),
                            ]),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow.withGreen(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () async {
                        formKey.currentState.save();

                        await FirebaseFirestore.instance
                            .collection("jobsInfo")
                            .add({
                          "email": LoginPage.trans_Email,
                          "position": position,
                          "location": location,
                          "jobDescription": jobDescription,
                          "type": dropDownValue,
                        });
                      },
                      child: Text("Post"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
