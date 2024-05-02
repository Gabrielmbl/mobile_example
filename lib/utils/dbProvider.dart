import 'package:flutter_application_1/utils/person.dart';
import 'package:sqflite/sqflite.dart';

final String tablePerson = 'person';
final String columnId = 'id';
final String columnUsername = 'username';
final String columnEmail = 'email';
final String columnPwd = 'pwd';

class dbProvider {
  var database;

  Future open(String path) async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tablePerson (
            $columnId integer primary key autoincrement,
            $columnUsername text not null,
            $columnEmail text not null,
            $columnPwd text not null
          )
      ''');
    });
  }

  Future<Person> insertPerson(Person person) async {
    print('inside method' + person.toMap().toString());
    person.id = await database.insert(tablePerson, person.toMap());
    print('saved ${person.id}');
    return person;
  }

  Future<Person?> getPerson(String username, String pwd) async {
    List<Map<String, Object?>> maps = await database.query(tablePerson,
        where: '$columnUsername = ? AND $columnPwd = ?',
        whereArgs: [username, pwd]);
    if (maps.length > 0) {
      print(Person.fromMap(maps.first));
      return Person.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Person>> getPeople() async {
    List<Map<String, Object?>> peopleData = await database.query(tablePerson);
    List<Person> listPeople =
        peopleData.map((personMap) => Person.fromMap(personMap)).toList();

    print(listPeople);
    return listPeople;
  }

  Future close() async => database.close();
}
