import 'dart:ui';
import 'package:alumnisoftwareapp/Post_Event.dart';
import 'package:alumnisoftwareapp/activityPage.dart';
import 'package:alumnisoftwareapp/drawer.dart';
import 'package:alumnisoftwareapp/profilePage.dart';
import 'package:alumnisoftwareapp/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  String title = "Profile";
  Color appBarColor;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActivityPage(),
      ),
    );
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    var turkey = tz.getLocation('Europe/Istanbul');
    tz.setLocalLocation(turkey);
  }

  @override
  Widget build(BuildContext context) {
    setPageDesign();
    dailyNotifications();
    weeklyNotifications();
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
      onTap: (i) => setState(() => _currentIndex = i),
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

  Future<void> dailyNotifications() async {
    await _configureLocalTimeZone();

    var time = Time(16, 0, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'media channel id 1',
      'media channel name 1',
      'media channel description 1',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidChannelSpecifics, iOS: iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Take a look ${time.hour}:${time.minute}.${time.second}',
      'ETUMED',
      time,
      platformChannelSpecifics,
      payload: 'Daily Notification',
    );
  }

  Future<void> weeklyNotifications() async {
    await _configureLocalTimeZone();

    var time = Time(21, 5, 0);
    var androidChannelSpecifics = AndroidNotificationDetails(
      'media channel id 2',
      'media channel name 2',
      'media channel description 2',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidChannelSpecifics, iOS: iosChannelSpecifics);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
      0,
      'What happened last week ${time.hour}:${time.minute}.${time.second}',
      'ETUMED',
      Day.saturday,
      time,
      platformChannelSpecifics,
      payload: 'Weekly Notifications',
    );
  }

  Future<void> cancelNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
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
