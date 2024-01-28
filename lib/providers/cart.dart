import 'package:flutter/material.dart';
import 'package:prov_app/models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // ketika sudah tersedia key productId
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + 1));
    } else {
      // Menambah product id baru
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }
    notifyListeners();
  }
}
