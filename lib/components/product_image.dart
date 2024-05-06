import 'package:flutter/material.dart';
import 'package:frontend/models/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.95,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey,
        ),
        clipBehavior: Clip.hardEdge,
        child: FadeInImage(
    image: NetworkImage(product.img ?? ''),
    placeholder: const AssetImage('assets/product-not-found.jpg'),
    imageErrorBuilder:(context, error, stackTrace) {
       return Image.asset('assets/product-not-found.jpg',
           fit: BoxFit.fitWidth
       );
    },
    fit: BoxFit.fitWidth,

 ),
      ),
    );
  }
}