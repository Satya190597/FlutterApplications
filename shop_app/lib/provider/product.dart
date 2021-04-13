import 'package:flutter/material.dart';
import '../data/ProductData.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _productList = DUMMY_PRODUCT_DATA;

  get items {
    return [...this._productList];
  }
}