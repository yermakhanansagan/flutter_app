import 'package:flutter/material.dart';
import 'package:flutterapp/Model/Person.dart';



import 'give_task.dart';

class WorkerPage extends StatelessWidget {
  final Person person;
  WorkerPage({Key key, @required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Worker Page"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: Text(
                person.name,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                person.email,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                person.number,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            OutlineButton(
              borderSide: BorderSide(color: Colors.black),
              shape: StadiumBorder(),
              textColor: Colors.black,
              child: Text("Give Task"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GiveTask()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
