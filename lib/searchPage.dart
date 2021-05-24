import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchControl = TextEditingController();
    return Container(
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
            top: MediaQuery.of(context).size.height * 0.6 / 10,
            left: 20,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width * 9 / 10,
                height: 50,
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
                  cursorColor: Colors.blueGrey,
                  controller: searchControl,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontFamily: "Ubuntu", fontSize: 17),
                    hintText: "   Search",
                    suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            top: 150,
            height: 30,
            width: MediaQuery.of(context).size.width * 8 / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.work_outline_outlined,
                        size: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.local_activity_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 200,
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
                          title: Text("Bora Barış Altuntaş",
                              style: TextStyle(fontFamily: "Ubuntu")),
                          subtitle: Text("Developer",
                              style: TextStyle(fontFamily: "Ubuntu")),
                          trailing: Text(
                            "Visit",
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
                          title: Text("Erciyes Mountain Climbing",
                              style: TextStyle(fontFamily: "Ubuntu")),
                          subtitle: Text("Erciyes / Kayseri",
                              style: TextStyle(fontFamily: "Ubuntu")),
                          trailing: Text("Join\nEvent",
                              style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange.shade200,
                        ),
                        width: MediaQuery.of(context).size.width * 9 / 10,
                        height: MediaQuery.of(context).size.height * 1 / 10,
                        child: ListTile(
                          title: Text("Jordan Peterson Seminar", style: TextStyle(fontFamily: "Ubuntu")),
                          subtitle: Text("Kadir Has / Kayseri",style: TextStyle(fontFamily: "Ubuntu")),
                          trailing: Text("Join\nEvent",
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
    );
  }
}
