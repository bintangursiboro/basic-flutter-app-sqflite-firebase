import 'package:basic_flutter_app/db/all_db_model.dart';
import 'package:basic_flutter_app/utility/database/database_helper.dart';
import 'package:basic_flutter_app/utility/injector/injector.dart';
import 'package:sqflite/sqflite.dart';

class MainPageSqflite {
  final Database db;
  MainPageSqflite({this.db});
  Future<int> insert(String name) async {
    return await db.insert('Student', {'name': name});
  }

  Future<void> insertNim() async {
    await db.update('Student', {'nim': '11S15051'},
        where: 'id = ?', whereArgs: [1]);
  }

  Future<DataModel> fetch(int id) async {
    var dataFromDB =
        await db.query('Student', where: "id = ?", whereArgs: [id]);
    return dataFromDB.isNotEmpty ? DataModel.fromDB(dataFromDB.first) : null;
  }
}
