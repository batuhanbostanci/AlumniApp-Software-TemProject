import 'dart:ui';
import 'package:alumnisoftwareapp/activityPage.dart';
import 'package:alumnisoftwareapp/drawer.dart';
import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:alumnisoftwareapp/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'login.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>

 {
  int _currentIndex = 0;
  String title = "Profile";
  Color appBarColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    setPageDesign();
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

  void setPageDesign() {
    if (_currentIndex == 0) {
      setState(() {
        title = "Profile";
        appBarColor = Colors.redAccent;
      });
    } else if (_currentIndex == 1) {
      setState(() {
        title = "Search";
        appBarColor = Colors.orange;
      });
    } else if (_currentIndex == 2) {
      setState(() {
        title = "Activities";
        print("current index is: " + _currentIndex.toString());
        appBarColor = Colors.blue.shade900;
      });
    } else {
      setState(() {
        title = "Home";
      });
    }
  }


  bottomNavigationBarGenerator() {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() =>_currentIndex = i),
      items: [
        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.redAccent,
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
          selectedColor: Colors.blue.shade900,
        ),
      ],
    );
  }
  // ignore: missing_return
  Widget bodyPage() {
    if (_currentIndex == 0) {
      return ProfilePage();
    } else if (_currentIndex == 1) {
      return SearchPage();
    } else if (_currentIndex == 2) {
      return ActivityPage();
    }
  }
}
