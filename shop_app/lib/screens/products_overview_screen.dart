// - packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// - widgets.
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

// - providers.
import '../provider/cart.dart';

// Enums for different filter options used in PopupMenuButton.
enum FilterOptions { All, Favourites }

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreenState createState() {
    return ProductsOverviewScreenState();
  }
}

class ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFavourite = false;

  @override
  Widget build(BuildContext context) {

    // Cart provider initialization.
    final cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MY SHOP'),
        actions: <Widget>[
          Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
            value: cartProvider.itemsCount.toString(),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedItem) {
              setState(() {
                if (selectedItem == FilterOptions.Favourites) {
                  this.showFavourite = true;
                } else {
                  this.showFavourite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favourite !'),
                  value: FilterOptions.Favourites),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(this.showFavourite),
    );
  }
}
