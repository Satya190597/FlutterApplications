import 'package:flutter/material.dart';
import '../data/ProductData.dart';
import './product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = DUMMY_PRODUCT_DATA;
  var showFavoritesOnly = false;
  get items {
    if(showFavoritesOnly) {
      return [...this._productList.where((element) => element.isFavorite)];
    }
    return [...this._productList];
  }

  void showFavoritesOnlyHandler() {
    this.showFavoritesOnly = true;
    notifyListeners();
  }

  void showAllHandler() {
    this.showFavoritesOnly = false;
    notifyListeners();
  }

}