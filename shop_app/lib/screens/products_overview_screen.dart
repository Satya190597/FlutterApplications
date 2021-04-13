import 'package:flutter/material.dart';
import '../provider/product.dart';

// Product Model.
import '../models/product.dart';

// Product Data.
import '../data/ProductData.dart';

// Widgets.
import '../widgets/product_item.dart';

import 'package:provider/provider.dart';



class ProductsOverviewScreen extends StatelessWidget {



  //List<Product> productList = [];



  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductProvider>(context);

    final List<Product> productList = productData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('MY SHOP'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(productList[i].id,productList[i].title,productList[i].imageUrl),
      ),
    );
  }
}
