import 'package:flutter/material.dart';
import 'package:flutterapp/ui/user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Workers"),
        ),
        body: Container(
          child: UserPage(),
        ),
      ),
    );
  }
}
