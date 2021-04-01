import 'package:flutter/material.dart';

// Product Model.
import '../models/product.dart';

// Product Data.
import '../data/ProductData.dart';

// Widgets.
import '../widgets/product_item.dart';



class ProductsOverviewScreen extends StatelessWidget {



  final List<Product> productList = DUMMY_PRODUCT_DATA;



  @override
  Widget build(BuildContext context) {



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
