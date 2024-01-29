import 'package:flutter/material.dart';
import 'package:prov_app/providers/cart.dart';
import 'package:prov_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${product.title}",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${product.description}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Berhasil ditambahkan'),
                  duration: Duration(milliseconds: 500),
                ));
                cart.addCart(
                    product.id.toString(),
                    product.title.toString(),
                    double.parse(product.price.toString()));
              },
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 25),
              ))
        ],
      ),
    );
  }
}
