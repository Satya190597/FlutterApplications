import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../provider/products.dart';
import '../provider/product.dart';

class ProductsGrid extends StatelessWidget {

  bool showFavourite;

  ProductsGrid([this.showFavourite = false]);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    final List<Product> productList = this.showFavourite ? productsProvider.favItems :  productsProvider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productList[i],
        child: ProductItem(
            //productList[i].id,
            //productList[i].title,
            //productList[i].imageUrl,
            ),
      ),
    );
  }
}
