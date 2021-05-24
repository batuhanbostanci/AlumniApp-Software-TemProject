import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade400,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height * 2 / 10,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.account_circle_rounded,
                          color: Colors.blueGrey,
                        ),
                        backgroundColor: Colors.teal.shade200,
                        radius: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Bora Barış Atuntaş",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.code,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "Github",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Ubuntu"),
                                    )),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.work_outline,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "LinkedIn",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Ubuntu"),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //color: Colors.red,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 2.5 / 10,
            child: SingleChildScrollView(
              child: Material(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      TabBar(controller: _tabController, tabs: [
                        Tab(
                          child: Text(
                            "About",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: "Ubuntu"),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Activity",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: "Ubuntu"),
                          ),
                        ),
                      ]),
                      Expanded(
                        child:
                            TabBarView(controller: _tabController, children: <
                                Widget>[
                          Container(
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.mail_outline),
                                  title: Text("borabaris.01@gmail.com"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.work_outline_outlined),
                                  title: Text("Developer"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text("Adana"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.school_outlined),
                                  title: Text("Computer Engineering"),
                                ),
                              ],
                            ),
                            //color: Colors.red,
                          ),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.teal.shade200,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        9 /
                                        10,
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        10,
                                    child: ListTile(
                                      title: Text("Erciyes Mountain Climbing",
                                          style:
                                              TextStyle(fontFamily: "Ubuntu")),
                                      subtitle: Text("Erciyes / Kayseri",
                                          style:
                                              TextStyle(fontFamily: "Ubuntu")),
                                      trailing: Text("Joined",
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
                                      color: Colors.teal.shade200,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        9 /
                                        10,
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        10,
                                    child: ListTile(
                                      title: Text("Jordan Peterson Seminar",
                                          style:
                                              TextStyle(fontFamily: "Ubuntu")),
                                      subtitle: Text("Kadir Has / Kayseri",
                                          style:
                                              TextStyle(fontFamily: "Ubuntu")),
                                      trailing: Text("Joined",
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
                        ]),
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
