import 'package:flutter/material.dart';
import 'package:orderapp/data/database_helper.dart';
import 'package:orderapp/models/order.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getAllOrders();
  }
  TextEditingController orderNameController = TextEditingController();
  // TextEditingController clientNameController = TextEditingController();
  bool isDone = false;
  changeIsCompleteOnNewOrderScreen() {
    isDone = !isDone;
    notifyListeners();
  }
   List<Order> AllOrders = [];
  List<Order> DeliveredOrders = [];
  List<Order> UnDeliveredOrders = [];
  fillOrdersLists(List<Order> orders) {
    AllOrders = orders;
    DeliveredOrders = orders.where((element) => element.isDone).toList();
    UnDeliveredOrders = orders.where((element) => !element.isDone).toList();
    notifyListeners();
  }

  insertNewOrder() async {
    Order order = Order(orderName: orderNameController.text, isDone: isDone);
    await DatabaseHelper.databaseHelper.insertNewOrder(order);
    getAllOrders();
  }

  getAllOrders() async {
    List<Order> allOrders = await DatabaseHelper.databaseHelper.getAllOrders();
    fillOrdersLists(AllOrders);
  }

  updateOrder(Order order) async {
    order.isDone = !order.isDone;
    await DatabaseHelper.databaseHelper.updateOneOrder(order);
    getAllOrders();
  }

  deleteOrder(Order order) async {
    await DatabaseHelper.databaseHelper.deleteOneOrder(order);
    getAllOrders();
  }

  void changeIsDoneOnNewOrderScreen() {}
}


