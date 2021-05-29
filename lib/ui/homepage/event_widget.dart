import 'package:flutter/material.dart';
import 'package:alumnisoftwareapp/styleguide.dart';

import '../../model/event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(


      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),


    child:Container(
     /* decoration: BoxDecoration(

        border: Border(

          top: BorderSide(color: Colors.grey[200], width: 1.0),
        ),
        color: Colors.white,
      ),*/
      height: 100,
      child: Row(
        children: <Widget>[

          Container(

            padding: EdgeInsets.only(
                top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                    event.title,
                    maxLines: 3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14.0)),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(

                                      (event.duration),
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0))
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),

          Expanded(
            child:Container(


               padding: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 2 / 5,
                height: 130,
                child:ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                child:FadeInImage.assetNetwork(

                    alignment: Alignment.center,
                    placeholder: event.imagePath,
                    image:
                    event.imagePath,
                    fit: BoxFit.fitHeight,
                   width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 1 / 3))
            ) ,
          ),


        ],
      ),
    ),);
  }

}
