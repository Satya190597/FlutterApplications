import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../provider/orders.dart' as OrderProvider;


class OrderItem extends StatefulWidget {

  final OrderProvider.OrderItem order;

  OrderItem(this.order);

  OrderItemState createState() {
    return OrderItemState();
  }

}


class OrderItemState extends State<OrderItem> {

  bool expanded = false;

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('${widget.order.amount}'),
          subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(widget.order.date)),
          trailing: IconButton(icon: this.expanded ? Icon(Icons.expand_less) : Icon(Icons.expand_more),onPressed: () {
            setState(() {
              this.expanded = !this.expanded;
            });
          },),
        ),
        if(this.expanded)
          Container(height: min(widget.order.products.length * 20 + 10.0, 180),
          child: ListView(children: widget.order.products.map((prod) {return Row(children: [
            Text(
              prod.title
            ),
            Text('${prod.quantity} x ${prod.price}'),
          ],);}).toList(),),)

      ],),
    );
  }
}