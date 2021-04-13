import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';

import '../provider/products.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  All,
  Favourites
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreenState createState() {
    return ProductsOverviewScreenState();
  }
}

class ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  bool showFavourite = false;

  @override
  Widget build(BuildContext context) {

    //final productsProvider = Provider.of<ProductProvider>(context,listen: false);



    return Scaffold(
      appBar: AppBar(
        title: Text('MY SHOP'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedItem) {
              setState(() {
                if(selectedItem == FilterOptions.Favourites) {
                  this.showFavourite = true;
                }
                else {
                  this.showFavourite = false;
                }
              });

            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favourite !'),value: FilterOptions.Favourites),
              PopupMenuItem(child: Text('Show All'),value: FilterOptions.All)
            ],
          )
        ],
      ),
      body: ProductsGrid(this.showFavourite),
    );
  }
}
