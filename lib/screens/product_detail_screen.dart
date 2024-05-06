import 'package:flutter/material.dart';
import 'package:frontend/constants/app_constants.dart';
import 'package:frontend/models/product.dart';
import 'package:frontend/screens/product_screen.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({required this.product, Key? key}) : super(key: key);
  final Product? product;


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Product? get product => widget.product;
  String? selectedImageUrl;

  @override
  void initState() {
    selectedImageUrl = product?.img;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        Get.back();
      },icon: const Icon(Icons.arrow_back),),title: Text(product!.name), backgroundColor: Colors.blueAccent,foregroundColor: Colors.white, actions: [IconButton(onPressed: (){
        print(product!.name);
        Get.offNamed(AppConstants.updateProduct, arguments: {"id": product!.name});
      }, icon: const Icon(Icons.edit))],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                 const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .35,
            color: Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FadeInImage(
    image: NetworkImage(product?.img ?? ''),
    placeholder: const AssetImage('assets/product-not-found.jpg'),
    imageErrorBuilder:(context, error, stackTrace) {
       return Image.asset('assets/product-not-found.jpg',
           fit: BoxFit.cover
       );
    },
    fit: BoxFit.cover,width: double.infinity,

 ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${product!.price}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product!.desc ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Spacer(),
                  // Center(
                  //   child: CallToActionButton(
                  //     onPressed: () => cart.add(
                  //       OrderItem(
                  //         product: product,
                  //         selectedSize: selectedSize,
                  //       ),
                  //     ),
                  //     labelText: 'Add to Cart',
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}