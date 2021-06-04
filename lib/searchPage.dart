import 'package:alumnisoftwareapp/jobPosting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var formKey = GlobalKey<FormState>();
  String dropDownValue = "Internship";
  String wantedPosition;
  String location;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchControl = TextEditingController();
    return Scaffold(
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 1 / 15,
        child: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => JobPostingPage()));
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height * 1.5 / 10,
                width: MediaQuery.of(context).size.width,
                //color: Colors.red,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 / 10,
              left: 20,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: MediaQuery.of(context).size.width * 9 / 10,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    cursorColor: Colors.blueGrey,
                    controller: searchControl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                      hintStyle: TextStyle(fontFamily: "Ubuntu", fontSize: 17),
                      hintText: "   Search",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.filter_alt_outlined),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: Text("Filtering"),
                                    content: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          right: -40.0,
                                          top: -40.0,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(Icons.close),
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  onSaved: (value) {
                                                    wantedPosition = value;
                                                  },
                                                  decoration: InputDecoration(
                                                    labelText:
                                                    "Wanted Position",
                                                    border:
                                                    OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  onSaved: (value) {
                                                    location = value;
                                                  },
                                                  decoration: InputDecoration(
                                                      labelText: "Location",
                                                      border:
                                                      OutlineInputBorder()),
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                              "Manner of Work")),
                                                      Expanded(
                                                        child: DropdownButton(
                                                            value:
                                                            dropDownValue,
                                                            onChanged:
                                                                (String value) {
                                                              setState(() {
                                                                dropDownValue =
                                                                    value;
                                                              });
                                                            },
                                                            items: [
                                                              DropdownMenuItem(
                                                                  value:
                                                                  "Internship",
                                                                  child: Text(
                                                                      "Internship")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                  "Long Term",
                                                                  child: Text(
                                                                      "Long Term")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                  "Part Time",
                                                                  child: Text(
                                                                      "Part Time")),
                                                            ]),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                        //color: Colors.orange,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          formKey.currentState.save();
                                        },
                                        child: Text("Save"),
                                        color: Colors.orange,
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              child: Material(
                child: Container(
                  height: MediaQuery.of(context).size.height * 5 / 10,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.pink,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade200,
                          ),
                          width: MediaQuery.of(context).size.width * 9 / 10,
                          height: MediaQuery.of(context).size.height * 1 / 10,
                          child: ListTile(
                            title: Text(
                              "Seeking for Data Scientist",
                              style: TextStyle(fontFamily: "Ubuntu"),
                            ),
                            subtitle: Text(
                              "Kayseri",
                              style: TextStyle(fontFamily: "Ubuntu"),
                            ),
                            trailing: Text(
                              "Apply\nNow",
                              style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade200,
                          ),
                          width: MediaQuery.of(context).size.width * 9 / 10,
                          height: MediaQuery.of(context).size.height * 1 / 10,
                          child: ListTile(
                            title: Text("Social Media Manager",
                                style: TextStyle(fontFamily: "Ubuntu")),
                            subtitle: Text("Istanbul",
                                style: TextStyle(fontFamily: "Ubuntu")),
                            trailing: Text("Apply\nNow",
                                style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
