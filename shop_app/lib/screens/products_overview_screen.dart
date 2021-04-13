import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

import '../provider/products.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  All,
  Favourites
}

class ProductsOverviewScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<ProductProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MY SHOP'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedItem) {
              if(selectedItem == FilterOptions.Favourites) {
                  productsProvider.showFavoritesOnlyHandler();
              }
              else {
                productsProvider.showAllHandler();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favourite !'),value: FilterOptions.Favourites),
              PopupMenuItem(child: Text('Show All'),value: FilterOptions.All)
            ],
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
