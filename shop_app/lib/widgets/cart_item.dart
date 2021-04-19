import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItem extends StatelessWidget {
  final String productId;
  final String id;
  final double price;
  final String title;
  final int quantity;

  CartItem(this.productId, this.id, this.price, this.title, this.quantity);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: ValueKey(this.id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      // Function gets trigger when dismissed events occurs.
      onDismissed: (direction) {
        cartProvider.removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are You Sure?'),
            content: Text('Do you want to remove the item from the cart?'),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(ctx).pop(false);
              }, child: Text('No')),
              TextButton(onPressed: () {
                Navigator.of(ctx).pop(true);
              }, child: Text('Yes')),
            ],
          ),
        );
        return Future.value(true);
      },
      child: Card(
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
        ),
      ),
    );
  }
}
