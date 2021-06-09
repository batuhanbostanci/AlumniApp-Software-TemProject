import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:alumnisoftwareapp/theme_provider.dart';
import 'package:alumnisoftwareapp/ui/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'information.dart';
import 'login.dart';
import 'main.dart';
import 'change_theme_button.dart';

class MyDrawer extends StatefulWidget {
  Color drawerColor;

  MyDrawer(this.drawerColor);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  ThemeMode themeMode = ThemeMode.system;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    check = themeProvider.isDarkMode;

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
              accountName: Text(ProfilePage.fullName),
              accountEmail: Text(LoginPage.trans_Email)),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInformationPage()));
                  },
                  splashColor: widget.drawerColor,
                  child: ListTile(
                    leading: Icon(Icons.work),
                    title: Text("Information"),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Theme"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Light Theme"),
                  SizedBox(
                    width: 20,
                  ),
                  ChangeThemeButton(),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Dark Theme"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
