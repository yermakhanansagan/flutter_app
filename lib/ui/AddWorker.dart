import 'package:flutter/material.dart';
import 'package:flutterapp/Database/PersonDB.dart';
import 'package:flutterapp/Model/Person.dart';


class AddWorker extends StatelessWidget {
  String email;
  String name;
  String number;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Worker Registration"),
      ),
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: SingleChildScrollView(
            child: new Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    validator: (val) => val.length == 0 ? "Enter Email" : null,
                    onSaved: (val) => this.email = val,
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          labelText: 'Name', border: OutlineInputBorder()),
                      validator: (val) => val.length == 0 ? "Enter Name" : null,
                      onSaved: (val) => this.name = val,
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Number', border: OutlineInputBorder()),
                      validator: (val) =>
                          val.length == 0 ? 'Enter Number' : null,
                      onSaved: (val) => this.number = val,
                    )),
                new Container(
                  width: 360,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: new OutlineButton(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    borderSide: BorderSide(color: Colors.black),
                    shape: StadiumBorder(),
                    textColor: Colors.black,
                    onPressed: _submit,
                    child: Text('Register'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    }
    var person = Person(email, name, number);
    var dbHelper = PersonDB();
    dbHelper.savePerson(person);
    _showSnackBar("Data saved successfully");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}
