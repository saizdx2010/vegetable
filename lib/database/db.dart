import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Database? db;
  Future open() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'vegetable.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE cart ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name VARCHAR(255),"
          "image VARCHAR(255),"
          "quantity INTEGER,"
          "price DOUBLE NOT NULL"
          ")");

      await db.execute("CREATE TABLE transaction ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "image VARCHAR(255),"
          "price INTEGER,"
          "quantity INTEGER,"
          "method VARCHAR(255),"
          "total INTEGER"
          ")");
    });

    // db = await databaseFactory.openDatabase(
    //   path,
    //   options: OpenDatabaseOptions(
    //       version: 1,
    //       onCreate: (Database db, int index) async {
    //         await db.execute('''

    //         CREATE TABLE cart (
    //           id INTEGER PRIMARY KEY AUTOINCREMENT,
    //           name VARCHAR(255),
    //           image VARCHAR(255),
    //           quantity INTEGER,
    //           price DOUBLE NOT NULL,
    //         );

    //         create table transaction (
    //           id INTEGER PRIMARY KEY AUTOINCREMENT,
    //           image VARCHAR(255),
    //           price INTEGER,
    //           quantity INTEGER,
    //           method VARCHAR(255),
    //           total INTEGER,
    //         );

    //         ''');
    //       }),
    // );
  }
}
