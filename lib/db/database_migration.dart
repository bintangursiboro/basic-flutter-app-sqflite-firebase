import 'package:basic_flutter_app/utility/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class DBMigrationListener extends DatabaseMigrationListener {
  static const int VERSION_1_0_0 = 1;

  @override
  void onCreate(Database db, int version) async {
    await _createDatabase(db, version);
  }

  @override
  void onUpgrade(Database db, int oldVersion, int newVersion) async {
    Batch batch = db.batch();
    print('Database succesfully upgraded');
    Queries.getQueriesCreate(
      oldVersion,
      newVersion,
    ).forEach((query) {
      batch.execute(query);
    });
    await batch.commit(noResult: false);
  }

  Future<void> _createDatabase(Database db, int version) async {
    if (VERSION_1_0_0 == version) {
      print('database succesfully created');
      Batch batch = db.batch();
      Queries.getQueriesCreate(
        0,
        version,
      ).forEach((query) {
        batch.execute(query);
      });
      await batch.commit(noResult: false);
    }
  }
}

class Queries {
  /// when added a new queries,
  /// you have to change the curr version at the index_test.dart
  static Map<int, List<String>> queriesCreate = {
    0: [], // for version db 0, give empty query (this is used for flagging)
    1: [
      '''CREATE TABLE Student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)''',
    ],
    2: ['''ALTER TABLE Student ADD nim TEXT''']
  };

  static List<String> getQueriesCreate(int oldVersion, int currversion) {
    List<String> queries = <String>[];
    var keys = Queries.queriesCreate.keys.toList();

    for (int i = oldVersion + 1; i <= currversion; i++) {
      /* if the key in the map exist then continue */
      if (Queries.queriesCreate.containsKey(keys[i]) &&
          Queries.queriesCreate[keys[i]].length > 0) {
        queries.addAll(Queries.queriesCreate[keys[i]]);
      }
    }
    return queries;
  }
}
