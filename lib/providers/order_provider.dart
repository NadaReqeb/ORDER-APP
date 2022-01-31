import 'package:flutter/material.dart';
import 'package:orderapp/models/order.dart';

import '../router.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> AllOrders = [];
  List<Order> DeliveredOrders = [];
  List<Order> UnDeliveredOrders = [];

  getAllLists() {
    DeliveredOrders = AllOrders.where((element) => element.isDone).toList();
    UnDeliveredOrders = AllOrders.where((element) => !element.isDone).toList();
    notifyListeners();
  }

  TextEditingController orderNameController = TextEditingController();
  bool orderIsDone = false;
  changeIsDoneOnNewOrderScreen() {
    this.orderIsDone = !this.orderIsDone;
    notifyListeners();
  }

  addNewOrder() {
    Order order =
        Order(orderName: orderNameController.text, isDone: orderIsDone);
    AllOrders.add(order);
    getAllLists();
    orderNameController.clear();
    orderIsDone = false;
     RouterClass.routerClass.popFunction();
  }

  removeOrder(Order order) {
    AllOrders.remove(order);
    getAllLists();
  }

  updateOrder(Order order) {
    int index = AllOrders.indexOf(order);
    AllOrders[index].isDone = !AllOrders[index].isDone;
    getAllLists();
  }
}
