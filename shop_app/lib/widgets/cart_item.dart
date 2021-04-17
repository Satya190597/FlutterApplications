import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  final int quantity;

  CartItem(this.id, this.price, this.title, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('\$${this.price}'),
                  ),
                ),
              ),
              title: Text(this.title),
              subtitle: Text('Total \$${(this.price * this.quantity)}'),
              trailing: Text('$quantity x')),
        ));
  }
}
