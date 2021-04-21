import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../widgets/user_product_item.dart';

import '../provider/products.dart';

import '../widgets/product_item.dart';
import '../widgets/app_drawer.dart';

import '../screens/edit_product_screen.dart';


class UserProductsScreen extends StatelessWidget {

  static String routeName = "manage_product";

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        })],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsProvider.items.length,
          itemBuilder: (ctx, index) {
            return Card(
            child:
              UserProductItem(
              productsProvider.items[index].title,
              productsProvider.items[index].imageUrl,
            ));
          },
        ),
      ),
    );
  }
}
