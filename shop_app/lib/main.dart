import 'package:flutter/material.dart';

// Widget.
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

import './provider/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.orange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: <String, WidgetBuilder>{
          ProductDetailScreen.routeName: (BuildContext context) =>
              ProductDetailScreen()
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hello World !'),
      ),
    );
  }
}
