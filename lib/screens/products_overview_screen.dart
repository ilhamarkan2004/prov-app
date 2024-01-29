import 'package:flutter/material.dart';
import 'package:prov_app/providers/cart.dart';
import 'package:prov_app/screens/cart_screen.dart';
import 'package:prov_app/widgets/product_grid.dart';
import 'package:prov_app/widgets/badge.dart' as CustomBadge;
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return CustomBadge.Badge(
                value: value.jumlah.toString(),
                child: ch!,
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
