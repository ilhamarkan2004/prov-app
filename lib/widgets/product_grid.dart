import 'package:flutter/material.dart';
import 'package:prov_app/providers/products.dart';
import 'package:prov_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allproducts = productData.allproducts;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allproducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        allproducts[i].id!,
        allproducts[i].title!,
        allproducts[i].imageUrl!,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
