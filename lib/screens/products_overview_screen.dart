import 'package:flutter/material.dart';
import 'package:prov_app/screens/cart_screen.dart';
import 'package:prov_app/widgets/product_grid.dart';
import 'package:prov_app/widgets/badge.dart' as CustomBadge;

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          CustomBadge.Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
            value: "0",
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
