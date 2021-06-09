import 'package:alumnisoftwareapp/login.dart';
import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mainPage.dart';
import 'ui/homepage/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //if the user exit system getShared pref comes the future information
  await getSharedPref();
  await getProfileInfo();

  print(MyApp.validated);
  runApp(MyApp());
}

//method for the getting infos from future
getSharedPref() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  MyApp.validated = pref.getBool("values") ?? false;
  ProfilePage.fullName = pref.getString("fullName") ?? null;
  LoginPage.trans_Email = pref.getString("E_mail") ?? null;
}

class MyApp extends StatelessWidget {
  static bool validated = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.redAccent,
        //brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color.fromARGB(255, 226, 8, 32),
      ),
      home: MyApp.validated ? MainPage() : HomePage(),
    );
  }
}
