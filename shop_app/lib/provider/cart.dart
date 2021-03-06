import 'package:flutter/foundation.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  // Initialize cart.
  Map<String, CartItem> _item = {};

  // Getter - get cart items.
  get items {
    return {..._item};
  }

  // Getter - get number of items inside a cart.
  get itemsCount {
    return _item.length;
  }

  // Getter - get total amount.
  get totalAmount {
    double totalAmount = 0;
    _item.forEach((key, value) {
      totalAmount += value.price * value.quantity;
    });
    return totalAmount.round();
  }

  // Add cart item to cart.
  void addItem(String key, String title, double price, int quantity) {
    if (_item.containsKey(key)) {
      return this.updateItem(key, quantity);
    }
    _item.putIfAbsent(
      key,
      () => CartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  // Update cart item inside a cart.
  void updateItem(String key, int quantity) {
    _item.update(
      key,
      (value) => CartItem(
        id: value.id,
        title: value.title,
        price: value.price,
        quantity: (value.quantity + quantity),
      ),
    );
    notifyListeners();
  }

  // Remove Item from cart.
  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  // Clear Cart
  void clearCart() {
    _item = {};
    notifyListeners();
  }

  // Remove A Single Item.
  void removeSingleItem(String productId) {
    if (!_item.containsKey(productId)) {
      return;
    }
    if (_item[productId].quantity > 1) {
      _item.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity - 1));
    }
    else {
      _item.remove(productId);
    }
    notifyListeners();
  }
}
