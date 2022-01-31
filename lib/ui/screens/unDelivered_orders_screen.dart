import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orderapp/providers/database_provider.dart';
import 'package:orderapp/ui/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class UnDeliveredOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DatabaseProvider>(builder: (context, marah, x) {
      return marah.UnDeliveredOrders.length == 0
          ? Center(
              child: Lottie.asset('assets/animations/done-button.json'),
            )
          : ListView.builder(
              itemCount: marah.UnDeliveredOrders.length,
              itemBuilder: (context, index) {
                return OrderWidget(
                  marah.UnDeliveredOrders.toList()[index],
                );
              });
    });
  }
}
