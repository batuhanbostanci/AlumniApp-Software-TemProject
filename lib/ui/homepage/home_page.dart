import 'package:flutter/material.dart';
import 'package:alumnisoftwareapp/model/category.dart';
import 'package:alumnisoftwareapp/model/event.dart';
import 'package:alumnisoftwareapp/styleguide.dart';
import 'package:alumnisoftwareapp/ui/event_details/event_details_page.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

import '../../login.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar:AppBar(title: Text("Search for jobs here"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ]),*/
      drawer: Drawer(),
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Home Page",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          IconButton(
                          icon: Icon(Icons.account_circle_rounded),
                            onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "What's Up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[for (final category in categories) CategoryWidget(category: category)],
                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for (final event  in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId)))
                              GestureDetector(
                                onTap: () {
                                  print("printed here" + event.toString());



                                  Navigator.of(context).push(

                                    MaterialPageRoute(
                                      builder: (context) => EventDetailsPage(event: event ),


                                    ),
                                  );
                                },
                                child: EventWidget(
                                  event: event,
                                ),
                              ),


                          ],
                        ),
                      ),

                    ),




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}

