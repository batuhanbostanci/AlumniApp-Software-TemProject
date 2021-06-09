import 'package:alumnisoftwareapp/login.dart';
import 'package:alumnisoftwareapp/socialMedia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'main.dart';
import 'mainPage.dart';
import 'socialMediaDetail.dart';


class ProfilePage extends StatefulWidget {
  static String fullName;
  static String job;
  static String location;
  static String degree;
  static bool infoValidated = false;

  static bool validatedEnter;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String location = "";
  String job = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.redAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              // color: Colors.green,
              padding: EdgeInsets.all(25),
              // height: MediaQuery.of(context).size.height * 2 / 10,
              //width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(
                          Icons.account_circle_rounded,
                          color: Colors.redAccent,
                        ),
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              //fireStore full name
                              ProfilePage.fullName,
                              // "fullName",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold),
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
                        Tab(
                          child: Text(
                            "Social Media",
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
                                  title: Text(
                                    //Firebase trans E-mail info
                                    LoginPage.trans_Email,
                                    //"email",
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.work_outline_outlined),
                                  title: Text(
                                    ProfilePage.infoValidated
                                        ? ProfilePage.job
                                        : "please fill",
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text(
                                    ProfilePage.infoValidated
                                        ? ProfilePage.location
                                        : "please fill",),
                                ),
                                ListTile(
                                  leading: Icon(Icons.school_outlined),
                                  title: Text(
                                    ProfilePage.infoValidated
                                        ? ProfilePage.degree
                                        : "please fill",),
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
                                      color: Colors.redAccent.shade100,
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
                                      color: Colors.redAccent.shade100,
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
                          Container(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Facebook"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      String url;
                                      SocialMediaPage.socialMediaAccounts
                                          .forEach((element) {
                                        if (element.name == "Facebook") {
                                          url = element.url;

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  new WebviewScaffold(
                                                    url: url,
                                                    appBar: new AppBar(
                                                      title: Text(
                                                          "Widget webview"),
                                                    ),
                                                  )));
                                        }
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SocialMediaDetail("Facebook")));
                                  },
                                ),
                                ListTile(
                                  trailing: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      String url;
                                      SocialMediaPage.socialMediaAccounts
                                          .forEach((element) {
                                        if (element.name == "Github") {
                                          url = element.url;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  new WebviewScaffold(
                                                    url: url,
                                                    appBar: new AppBar(
                                                      title: Text(
                                                          "Widget webview"),
                                                    ),
                                                  )));
                                        }
                                      });
                                    },
                                  ),
                                  title: Text("Github"),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SocialMediaDetail("Github")));
                                  },
                                ),
                                ListTile(
                                  title: Text("Twitter"),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SocialMediaDetail("Twitter")));
                                  },
                                ),
                                ListTile(
                                  title: Text("LinkedIn"),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SocialMediaDetail("LinkedIn")));
                                  },
                                ),
                              ],
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
