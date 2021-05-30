import 'package:alumnisoftwareapp/ui/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class MyDrawer extends StatefulWidget {
  Color drawerColor;

  MyDrawer(this.drawerColor);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: widget.drawerColor,
              ),

              // currentAccountPictureSize: Size.square(80),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.account_circle_rounded),
              ),
              accountName: Text("bbaltuntas"),
              accountEmail: Text("borabarisaltuntas@gmail.com")),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text("Profile"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Search"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(
                      Icons.local_activity_outlined,
                    ),
                    title: Text("Activities"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    //set validated to false then the user can login in login Page
                    setState(() {
                      MyApp.validated = false;
                    });
                    await setSharedPref();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Exit"),
                    trailing: Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Set Pref for the automatic login to the system
  setSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setBool("values", MyApp.validated);
  }
}
