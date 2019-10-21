import 'package:basic_flutter_app/db/database_migration.dart';
import 'package:basic_flutter_app/page/main/service/sqflite/main_page_sqflite_service.dart';
import 'package:basic_flutter_app/utility/database/database_helper.dart';
import 'package:kiwi/kiwi.dart';

class InjectorContaiener {
  InjectorContaiener();

  void initInjection() {
    final Container container = Container();

    container.registerInstance(DBMigrationListener());
    container.registerFactory(
        (c) => DatabaseConfig(2, 'main.db', c.resolve<DBMigrationListener>()));
    container.registerFactory(
        (c) => DatabaseHelper(databaseConfig: c.resolve<DatabaseConfig>()));
    // container.registerFactory((c) async =>
    //     MainPageSqflite(db: await c.resolve<DatabaseHelper>().database));
  }

  DBMigrationListener getDBMigrationListener() {
    final Container container = Container();
    return container.resolve<DBMigrationListener>();
  }

  DatabaseConfig getDatabaseConfig() {
    final Container container = Container();
    return container.resolve<DatabaseConfig>();
  }

  DatabaseHelper getDatabaseHelper() {
    final Container container = Container();
    return container.resolve<DatabaseHelper>();
  }

  // Future<MainPageSqflite> getMainPageSqflite() async {
  //   final Container container = Container();
  //   return container.resolve<MainPageSqflite>();
  // }
}
