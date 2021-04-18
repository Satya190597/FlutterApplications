import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: [
        AppBar(
          title: Text('Hello'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Payments'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }
        )
      ],
    ));
  }
}