import 'package:flutter/material.dart';
import 'package:flutterapp/ui/workers_list.dart';

import 'AddWorker.dart';


class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.only(top: 15),
            height: 50,
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.black),
              shape: StadiumBorder(),
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkersList()),
                );
              },
              child: Text(
                "My Workers List",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.only(top: 15),
            height: 50,
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.black),
              shape: StadiumBorder(),
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddWorker()),
                );
              },
              child: Text(
                "Regitration of new Worker",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
