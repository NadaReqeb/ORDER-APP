import 'package:flutter/material.dart';
import 'package:orderapp/router.dart';
import 'package:orderapp/ui/screens/all_order_screen.dart';
import 'package:orderapp/ui/screens/delivered_orders_screen.dart';
import 'package:orderapp/ui/screens/new_order_screen.dart';
import 'package:orderapp/ui/screens/unDelivered_orders_screen.dart';

class OrderMainPage extends StatefulWidget {
  @override
  State<OrderMainPage> createState() => _OrderMainPageState();
}

class _OrderMainPageState extends State<OrderMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  initTabController() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      String message = tabController.index == 1
          ? 'You Are In All order Tab'
          : tabController.index == 1
              ? 'You Are In Done Order'
              : 'You Are In Not Done Order';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pink,
              child: Icon(Icons.add),
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(NewOrderScreen());
              },
            ),
            drawer: Drawer(
              // backgroundColor: Colors.pink,
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                    ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('O'),
                      ),
                      accountName: Text('Nada'),
                      accountEmail: Text('nada99@gmail.com')),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(0);
                    },
                    title: Text('All Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(1);
                    },
                    title: Text('Delivered Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(2);
                    },
                    title: Text('UnDelivered Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.pink,
              title: Text('ORDER APP'),
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
        unselectedLabelColor: Colors.pink.shade100,
        indicatorColor:Color(0xffffffff) ,
        
        // indicator: MD2Indicator(
        //     indicatorHeight: 3,
        //     indicatorColor: Theme.of(context).accentColor,
        //     indicatorSize: MD2IndicatorSize.full),
                controller: tabController,
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                  Tab(
                    icon: Icon(Icons.done),
                  ),
                  Tab(
                    icon: Icon(Icons.cancel_outlined),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: index,
            //   onTap: (newindex) {
            //     setState(() {
            //       this.index = newindex;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(label: 'All', icon: Icon(Icons.list)),
            //     BottomNavigationBarItem(label: 'Delivered', icon: Icon(Icons.done)),
            //     BottomNavigationBarItem(
            //         label: 'UnDelivered', icon: Icon(Icons.wrong_location_outlined)),
            //   ],
            // ),
            body: 
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.green.withOpacity(0.0),
            //     border:
            //         Border(top: BorderSide(color: Colors.green, width: 0.8)),
            //   ),
            //   child: 
            TabBarView(
                  // indicatorColor: Color(Colors.red),
                  controller: tabController,
                  children: [
                    AllOrdersScreen(),
                    DeliveredOrdersScreen(),
                    UnDeliveredOrdersScreen(),
                  ]),
            )
        : Scaffold(
            appBar: AppBar(
              title: Text('ORDER APP'),
            ),
            body: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('O'),
                          ),
                          accountName: Text('Nada'),
                          accountEmail: Text('nada99@gmail.com')),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(0);
                        },
                        title: Text('All Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(1);
                        },
                        title: Text('Delivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(2);
                        },
                        title: Text('UnDelivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  AllOrdersScreen(),
                  DeliveredOrdersScreen(),
                  UnDeliveredOrdersScreen(),
                ]))
              ],
            ),
          );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('NadaReqeb'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return AppBar().preferredSize;
  }
}
