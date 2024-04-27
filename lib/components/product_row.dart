import 'package:flutter/material.dart';
import 'package:frontend/components/product_tile.dart';
import 'package:frontend/models/product.dart';

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
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => productTiles[index],
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 24,
                  ),
                ),
              ),
            ],
          );
  }
}