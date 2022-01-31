import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orderapp/providers/database_provider.dart';
import 'package:orderapp/ui/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class DeliveredOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DatabaseProvider>(builder: (context, nada, x) {
      return nada.DeliveredOrders.length == 0
          ? Center(
              child: Lottie.asset('assets/animations/bag-error.json'),
            )
          : ListView.builder(
              itemCount: nada.DeliveredOrders.length,
              itemBuilder: (context, index) {
                return OrderWidget(
                  nada.DeliveredOrders.toList()[index],
                );
              });
    });
  }
}