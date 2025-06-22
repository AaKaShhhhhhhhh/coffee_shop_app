import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartState extends ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  void addToCart(Product product, String size, {int quantity = 1}) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity, size: size));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    final index = _items.indexOf(item);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  double get subtotal =>
      _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
