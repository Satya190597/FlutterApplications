// - Packages.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// - Widgets.
import '../screens/product_detail_screen.dart';

// - Providers.
import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Product provider initialization.
    final product = Provider.of<Product>(context);
    // Cart provider initialization.
    final cartProvider = Provider.of<Cart>(context, listen: false);

    // Navigation Handler.
    void navigationHandler() {
      Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
          arguments: {'id': product.id});
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: navigationHandler,
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              cartProvider.addItem(product.id, product.title, product.price, 1);
            },
          ),
        ),
      ),
    );
  }
}
