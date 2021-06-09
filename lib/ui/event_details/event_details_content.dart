import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/event.dart';
import '../../model/guest.dart';
import '../../styleguide.dart';

class EventDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            //gradient: Style.Colors.primaryGradient
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Read More",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro-Bold",
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
      /*  appBar: AppBar(
    elevation: 0.0,
   // backgroundColor: Style.Colors.mainColor,
    title: new Text(
  event.title,
    style: TextStyle(
    fontSize: Theme.of(context).platform == TargetPlatform.android
    ? 17.0
        : 17.0,
    color: Colors.white,
    fontWeight: FontWeight.bold),
    ),
    ),*/
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 16,
            child: Image.asset(
              event.imagePath,
              fit: BoxFit.fill,
              width: screenWidth,
              color: Color(0x99000000),
              colorBlendMode: BlendMode.darken,
              //height: screenHeight * 0.5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(event.duration,
                        style: TextStyle(
                            //color: Style.Colors.mainColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(event.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  event.description,
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                Text(
                  event.punchLine1,
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
