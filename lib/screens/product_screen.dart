import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';
import 'package:frontend/components/bottom_nav.dart';
import 'package:frontend/components/header.dart';
import 'package:frontend/components/product_item.dart';
import 'package:frontend/components/product_row.dart';
import 'package:frontend/components/stripe_form.dart';
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
  late ScrollController controller;

  @override
  void initState() {
    productController.loadProducts();
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!), backgroundColor: Colors.blueAccent,foregroundColor: Colors.white),
      body: Obx(() {
        if (productController.isLoading.value && productController.products.value.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (!productController.isLoading.value && productController.products.value.isEmpty) {
          return const Center(child: Text("No data found!"));
        } else {
          return GridView.builder(
            controller: controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: productController.isLoading.value ? productController.products.value.length + 1: productController.products.value.length,
            itemBuilder: (context, index) {
              if(index < productController.products.value.length){
                return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(productController.products.value[index].name),
                        IconButton(onPressed: (){
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return const StripeForm();
                              },
                            );
                        }, icon: const Icon(Icons.payment))
                      ],
                    ),
                  ),
                ),
              );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          );
        }
      }),
      // bottomNavigationBar: const BottomNav(),
      drawer: const DrawerNav(),
    );
  }

    void _scrollListener() {
        print(productController.hasMore.value);
    if (controller.position.extentAfter < 500 && productController.hasMore.value) {
      productController.page.value = productController.page.value++;
      productController.loadProducts();
    }}
}