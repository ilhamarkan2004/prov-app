import 'package:flutter/material.dart';
import 'package:prov_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _allproducts = [];

  List<Product> get allproducts {
    return [..._allproducts];
  }

  void addproduct(value) {
    _allproducts.add(value);
    notifyListeners();
  }
}
