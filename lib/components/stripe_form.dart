import 'package:flutter/material.dart';
import 'package:frontend/controllers/order_controller.dart';
import 'package:get/get.dart';

class StripeForm extends StatefulWidget{
  const StripeForm({super.key, required this.productId, required this.ctx});
  final String productId;
  final BuildContext ctx;

  @override
  State<StripeForm> createState() => _StripeFormState();
}

class _StripeFormState extends State<StripeForm> {
  String get productId => widget.productId;
  BuildContext get ctx => widget.ctx;
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: () async {
          print('clicked!');
          await orderController.initPaymentSheet(productId: productId, ctx: ctx);
        },
      child: const Row(children: [Icon(Icons.payment), Text("Proceed Payment")],),
      ),),
    );
  }
}