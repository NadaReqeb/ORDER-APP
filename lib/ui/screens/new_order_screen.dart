import 'package:flutter/material.dart';
import 'package:orderapp/providers/database_provider.dart';
import 'package:provider/provider.dart';

class NewOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('New Order'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
                  Provider.of<DatabaseProvider>(context).orderNameController,
              decoration: InputDecoration(
                  label: Text('Order Name') , 
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            // TextField(
            //   controller:
            //       Provider.of<DatabaseProvider>(context).ClientNameController,
            //   decoration: InputDecoration(
            //       label: Text('Client Name'),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(15))),
            // ),
            // CheckboxListTile(
            //   value: Provider.of<DatabaseProvider>(context).isDone,
            //   onChanged: (value) {
            //     Provider.of<DatabaseProvider>(context, listen: false)
            //         .changeIsDoneOnNewOrderScreen();
            //   },
            //   title: Text('I have done this order'),
            // ),
            InkWell(
              onTap: () async {
                await Provider.of<DatabaseProvider>(context, listen: false)
                    .insertNewOrder();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Add The Order',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
