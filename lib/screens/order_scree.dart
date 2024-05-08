import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';
import 'package:frontend/controllers/grid_controller.dart';
import 'package:frontend/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatefulWidget {

  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrderController orderController = Get.put(OrderController());

  late ScrollController controller;



  @override
  void initState() {
    super.initState();
    orderController.loadGrids();
    // controller = ScrollController()..addListener(_scrollListener);
  }

  // @override
  // void dispose() {
  //   controller.removeListener(_scrollListener);
  //   super.dispose();
  // }

  // Create a ScrollController
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View Builder"),
      ),
      body: Obx(() {
        if (orderController.isLoading.value && orderController.orders.value.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (!orderController.isLoading.value && orderController.orders.value.isEmpty) {
          return const Center(child: Text("No data found!"));
        } else {
          return GridView.builder(
            controller: controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: orderController.isLoading.value ? orderController.orders.value.length + 1: orderController.orders.value.length,
            itemBuilder: (context, index) {
              if(index < orderController.orders.value.length){
                return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(orderController.orders.value[index].product!.name!),
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
      drawer: const DrawerNav(),
    );
  }
}
