// - Packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// - Providers.
import '../provider/cart.dart';

// - Widgets
import '../widgets/cart_item.dart' as CartItemWidget;

class CartScreen extends StatelessWidget {
  static final routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final List<CartItem> cartItemValues = cartProvider.items.values.toList();
    final List<String> cartItemsKeys = cartProvider.items.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart.'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return CartItemWidget.CartItem(
                    cartItemsKeys[index],
                    cartItemValues[index].id,
                    cartItemValues[index].price,
                    cartItemValues[index].title,
                    cartItemValues[index].quantity);
              },
              itemCount: cartProvider.itemsCount,
            ),
          ),
        ],
      ),
    );
  }
}
