import 'package:flutter/material.dart';

class GiveTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Task"),
        ),
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  decoration: new InputDecoration(
                      labelText: 'Description', border: OutlineInputBorder()),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.black),
                    shape: StadiumBorder(),
                    textColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("Give Task"),
                    onPressed: () {
                      SnackBar(
                        content: Text("Task Given"),
                      );
                    },
                  ))
            ],
          ),
        ));
  }
}
