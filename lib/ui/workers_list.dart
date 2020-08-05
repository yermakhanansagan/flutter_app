import 'package:flutter/material.dart';
import 'package:flutterapp/Database/PersonDB.dart';
import 'dart:async';

import 'package:flutterapp/Model/Person.dart';
import 'package:flutterapp/ui/worker_page.dart';


Future<List<Person>> fetchWorksFromDatabase() async {
  var dbHelper = PersonDB();
  Future<List<Person>> person = dbHelper.getPersons();
  return person;
}

class WorkersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WorkersList();
  }
}

class _WorkersList extends State<WorkersList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Workers List"),
      ),
      body: new Container(
        child: new FutureBuilder<List<Person>>(
          future: fetchWorksFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkerPage(person: snapshot.data[index])),
                        );
                      },
                      child: Container(
                        margin: new EdgeInsets.all(10.0),
                        padding: new EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(snapshot.data[index].name,
                                style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return new Text("No Data found");
            }
          },
        ),
      ),
    );
  }
}
