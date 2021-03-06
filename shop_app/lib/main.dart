import 'package:flutter/material.dart';

// Widget.
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

import './provider/products.dart';
import './provider/cart.dart';
import './provider/orders.dart';



import 'package:provider/provider.dart';


void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders()),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.orange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: <String, WidgetBuilder>{
          ProductDetailScreen.routeName: (BuildContext context) =>
              ProductDetailScreen(),
          CartScreen.routeName: (BuildContext context) => CartScreen(),
          OrdersScreen.routeName: (BuildContext context) => OrdersScreen(),
          UserProductsScreen.routeName: (BuildContext context) => UserProductsScreen(),
          EditProductScreen.routeName: (BuildContext context) => EditProductScreen(),
        },
      ),
    );
    //   ChangeNotifierProvider(
    //   create: (context) => ProductProvider(),
    //   child: MaterialApp(
    //     title: 'My Shop',
    //     theme: ThemeData(
    //         primarySwatch: Colors.purple,
    //         accentColor: Colors.orange,
    //         fontFamily: 'Lato'),
    //     home: ProductsOverviewScreen(),
    //     routes: <String, WidgetBuilder>{
    //       ProductDetailScreen.routeName: (BuildContext context) =>
    //           ProductDetailScreen()
    //     },
    //   ),
    // );
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
