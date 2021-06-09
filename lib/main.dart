import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:alumnisoftwareapp/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'mainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              accentColor: Colors.redAccent,
              scaffoldBackgroundColor: Color(0xFFFFFFFF),
              primaryColor: Color.fromARGB(255, 226, 8, 32),
            ),
            darkTheme: MyThemes.darkTheme,
            title: '',
            home: HomePage(),
          );
        },
      );
}
