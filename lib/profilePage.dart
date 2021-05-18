import 'dart:ui';

import 'package:alumnisoftwareapp/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  String title = "Profile";
  Color appBarColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 0) {
      setState(() {
        title = "Profile";
        appBarColor = Colors.teal.shade400;
      });
    } else if (_currentIndex == 1) {
      setState(() {
        title = "Search";
        appBarColor = Colors.orange;
      });
    } else {
      setState(() {
        title = "Activities";
        appBarColor = Colors.pink;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(title),
      ),
      drawer: MyDrawer(appBarColor),
      body: bodyPage(),
      bottomNavigationBar: bottomNavigationBarGenerator(),
    );
  }

  bottomNavigationBarGenerator() {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: [
        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.teal.shade400,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
          selectedColor: Colors.orange,
        ),

        /// Activities
        SalomonBottomBarItem(
          icon: Icon(Icons.local_activity_outlined),
          title: Text("Activities"),
          selectedColor: Colors.pink,
        ),

        /// Home
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.purple,
        ),
      ],
    );
  }

  Widget bodyPage() {
    if (_currentIndex == 0) {
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
                          child: Icon(Icons.account_circle_rounded),
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
                          child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                Container(
                                  child: ListView(
                                    children: <Widget>[
                                      ListTile(
                                        leading: Icon(Icons.mail_outline),
                                        title: Text("borabaris.01@gmail.com"),
                                      ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.work_outline_outlined),
                                        title: Text("Developer"),
                                      ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.location_on_outlined),
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
                                  color: Colors.purple,
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
    } else if (_currentIndex == 1) {
      return Container(
        color: Colors.orange,
      );
    } else if (_currentIndex == 2) {
      return Container(
        color: Colors.pink,
      );
    }
  }
}
