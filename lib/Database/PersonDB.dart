import 'dart:async';
import 'dart:io' as io;
import 'package:flutterapp/Model/Person.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class PersonDB {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Person.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Person with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute("CREATE TABLE Person(email TEXT, name TEXT, number TEXT)");
    print("Created tables");
  }

  // Retrieving Persons from Person Tables
  Future<List<Person>> getPersons() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Person');
    List<Person> Persons = new List();
    for (int i = 0; i < list.length; i++) {
      Persons.add(
          new Person(list[i]['email'], list[i]['name'], list[i]['number']));
    }
    print(Persons.length);
    return Persons;
  }

  void savePerson(Person Person) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Person(email, name, number) VALUES(' +
              '\'' +
              Person.email +
              '\'' +
              ',' +
              '\'' +
              Person.name +
              '\'' +
              ',' +
              '\'' +
              Person.number +
              '\'' +
              ')');
    });
  }
}
