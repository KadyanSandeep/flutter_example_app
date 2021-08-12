import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_app/Event.dart';

class EventsListPage extends StatefulWidget {
  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  List<Event> eventsList = [];

  @override
  void initState() {
    _loadItems();
  }

  _loadItems() async {
    for (var i = 0; i < 5; i++) {
      eventsList.add(Event(
          i.toString(),
          "title " + i.toString(),
          "desc " + i.toString(),
          "image",
          "venue " + i.toString(),
          "eventDate",
          false));
    }
  }

  @override
  Widget build(BuildContext context) {
    //Note note;

    return Scaffold(
      appBar:
          /*AppBar(
        centerTitle: false,
        title: Text("Events"),
      ),*/
          null,
      body: Stack(
        children: [
          Container(
            height: 70.0,
            width: 1000.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.blue,
            ),
          ),
          ListView.builder(
              itemCount: eventsList.length,
              itemBuilder: (BuildContext context, int index) {
                return layoutItem(
                    eventsList[index].id,
                    eventsList[index].image,
                    eventsList[index].title,
                    eventsList[index].desc,
                    eventsList[index].eventDate,
                    context);
              })
        ],
      ),
    );
  }

  Widget layoutItem(String id, image, title, desc, text, BuildContext context) {
    final _key = GlobalKey();
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 20,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: new BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.3),
          borderRadius: new BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 50,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 5.0),
                                child: Container(
                                  child: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                                child: Text(
                                  "01/01/21 10:00 AM",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 4.0,
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle,size: 50,),
            )
          ],
        ),
      ),
    );
  }
}
