import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/orders.dart' show Orders;

import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {

    final ordersProvider = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemBuilder: (ctx,index) {
        return OrderItem(ordersProvider.orders[index]);
      },itemCount: ordersProvider.orders.length,),
      // body: ListView.builder(itemBuilder: (ctx,index) {
      //   return Text('Hello');
      // },itemCount: ordersProvider.orders.length,),
    );
  }

}