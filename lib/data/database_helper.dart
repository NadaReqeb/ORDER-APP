import 'dart:io';

import 'package:orderapp/models/order.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper databaseHelper = DatabaseHelper._();
  Database database;
  initDatabase() {
    connectToDatabase();
  }

  connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + '/orders.db';
    database = await openDatabase(databasePath, version: 1, onCreate: (db, v) {
      db.execute('''
      CREATE TABLE orders 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, orderName TEXT, clientName TEXT, isDone INTEGER)
      ''');
    });
  }

  Future<List<Order>> getAllOrders() async {
    List<Map<String, Object>> data = await database.query('orders');
    List<Order> ordersList = [];
    for (int x = 0; x < data.length; x++) {
      Map map = data[x];
      Order orderObj = Order(
          id: map['id'],
          orderName: map['orderName'],
          clientName: map['clientName'],
          isDone: map['isDone'] == 1 ? true : false);

      ordersList.add(orderObj);
    }
    List<Order> ordersPnjects = data.map((Map map) {
      return Order.fromMap(map);
    }).toList();
    return ordersPnjects;
  }

  Future<Order> getOneOrder(int id) async {
    List<Map<String, Object>> data =
        await database.query('orders', where: 'id=?', whereArgs: [id]);
    Map<String, Object> order = data.first;
    return Order.fromMap(order);
  }

  Future<int> insertNewOrder(Order order) async {
    int rowCount = await database.insert('orders', order.toMap());
    return rowCount;
  }

  updateOneOrder(Order order) async {
    database
        .update('orders', order.toMap(), where: 'id=?', whereArgs: [order.id]);
  }

  deleteOneOrder(Order order) async {
    database.delete('orders', where: 'id=?', whereArgs: [order.id]);
  }
}
