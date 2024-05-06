import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';
import 'package:frontend/components/bottom_nav.dart';
import 'package:frontend/components/header.dart';
import 'package:frontend/components/product_item.dart';
import 'package:frontend/components/product_row.dart';
import 'package:frontend/controllers/product_controller.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/product.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({this.title = 'All Products', Key? key}) : super(key: key);
  String? title = 'All Products';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
    String? get title => widget.title;
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!), backgroundColor: Colors.blueAccent,foregroundColor: Colors.white),
      body: Obx(() {
          if(productController.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            if(productController.products.isEmpty){
              return const Center(child: Text('No Products!'),);
            }else{
              return ProductRow(products: productController.products);
            }
          }
        }),
      // bottomNavigationBar: const BottomNav(),
      drawer: const DrawerNav(),
    );
  }
}