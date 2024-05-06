import 'package:flutter/material.dart';
import 'package:frontend/components/product_image.dart';
import 'package:frontend/components/product_tile.dart';
import 'package:frontend/models/product.dart';
import 'package:frontend/screens/product_detail_screen.dart';
import 'package:get/get.dart';

class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, Key? key})
      : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles =
        products.map((p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
          itemCount: productTiles.length,

          itemBuilder: (BuildContext context, index) {
            final product = products[index];
          return Expanded(child: GestureDetector(onTap: () {
              Get.off(ProductDetailsScreen(product: product));
          },child: SizedBox(width: double.infinity, height: double.infinity,child: Padding(padding: const EdgeInsets.all(10),
          child: Column(children: [
ProductImage(product: product),
            Text(product.name),
            // Text(product.desc),
            // Text(product.stock.toString()),
            // Text( product.price.toString()),
            ],),),),));
        });
  }
}