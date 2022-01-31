import 'package:flutter/material.dart';
import 'package:orderapp/providers/database_provider.dart';
import 'package:orderapp/ui/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class AllOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, providerInstance, x) {
      return ListView.builder(
          itemCount: providerInstance.AllOrders.length,
          itemBuilder: (context, index) {
            return OrderWidget(
              providerInstance.AllOrders[index],
            );
          });
    });
  }
}
