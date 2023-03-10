import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vegetable/models/cart.dart';
import 'package:vegetable/models/payment.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'vegetable2.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(tableCart);
    await db.execute(tablePayment);
  }

  // Static
  static const tableCart = """
  CREATE TABLE cart (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      image TEXT,
      quantity INTEGER,
      price DOUBLE NOT NULL
    );""";

  static const tablePayment = """
  CREATE TABLE payment (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      price DOUBLE NOT NULL,
      paymentMethod TEXT,
      date TEXT,
      status TEXT
    );""";

  Future<List<Cart>> getCart() async {
    Database db = await instance.database;
    //
    var carts = await db.rawQuery('SELECT * FROM cart group by name');

    List<Cart> cartList =
        carts.isNotEmpty ? carts.map((c) => Cart.fromJson(c)).toList() : [];

    return cartList;
  }

  Future<int> insertCart(Cart cart) async {
    Database db = await instance.database;
    return await db.insert('cart', cart.toJson());
  }

  Future<int> insertPayment(Payment payment) async {
    Database db = await instance.database;
    return await db.insert('payment', payment.toJson());
  }

  Future<int> updateCart(Cart cart) async {
    Database db = await instance.database;
    return await db.update('cart', cart.toJson(),
        where: 'name = ?', whereArgs: [cart.name]);
  }

  Future<int> deleteCart(String name) async {
    Database db = await instance.database;
    return await db.delete('cart', where: 'name = ?', whereArgs: [name]);
  }

  Future<int> deleteAllCart() async {
    Database db = await instance.database;
    return await db.delete('cart');
  }
}
