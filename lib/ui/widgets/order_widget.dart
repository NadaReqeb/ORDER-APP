import 'package:flutter/material.dart';
import 'package:orderapp/models/order.dart';
import 'package:orderapp/providers/database_provider.dart';
import 'package:provider/provider.dart';

class OrderWidget extends StatelessWidget {
  Order order;
  OrderWidget(list, {this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: CheckboxListTile(
          value: order.isDone,
          onChanged: (value) {
            Provider.of<DatabaseProvider>(context, listen: false)
                .updateOrder(order);
          },
          secondary: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
            Provider.of<DatabaseProvider>(context, listen: false)
                .deleteOrder(order);
          },
            ),
            title: Text(order.orderName),
        ),
      ),

    );
  }
}
