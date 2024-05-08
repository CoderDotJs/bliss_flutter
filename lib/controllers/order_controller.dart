import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/order.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  final UserController userController = Get.put(UserController());
  Rx<RxList<Order>> orders = RxList<Order>([]).obs;
  RxInt page = 0.obs;
  RxInt limit = 10.obs;
  RxBool isLoading = false.obs;

    void loadGrids()async{
    try{
      isLoading.value = true;
      final String url = 'https://jsonplaceholder.typicode.com/todos?_start=$page&_limit=$limit';
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        RxList<Order> list =  RxList<Order>.from(json.decode(response.body).map((x) => Order.fromJson(x)));
        orders.value = list;
      }else{
        throw response;
      }
    }catch(err){
      Get.snackbar('Error', err.toString());
    } finally {
        isLoading.value = false;
        update();
      }
  }

  Future<void> initPaymentSheet({required String productId, required BuildContext ctx}) async {
    try {
      print(productId);
      // 1. create payment intent on the server
      final data = await createPaymentIntent(productId);
      print(data);

      // 2. initialize the payment sheet
     await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: true,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['data']['client_secret'],
        ),
      );
      // ignore: use_build_context_synchronously
      await displayPaymentSheet(ctx: ctx, orderId: data['data']['_id']);
    } catch (e) {
      Get.snackbar('Error!', e.toString());
      rethrow;
    }
  }

  displayPaymentSheet({required BuildContext ctx, required String orderId}) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print(value);
        print('success');
        completePayment(orderId);
        Navigator.pop(ctx);
        Get.snackbar("Payment", "Payment successful", snackPosition: SnackPosition.BOTTOM);
      }).onError((error, stackTrace) {
        Navigator.pop(ctx);
        cancelPayment(orderId);
        print(error);
        Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);
      });
    } on StripeException {
        // ignore: use_build_context_synchronously
        Navigator.pop(ctx);
      Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
        // ignore: use_build_context_synchronously
        Navigator.pop(ctx);
      Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  createPaymentIntent(id) async {
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/order');
          print(url);
      var response = await http.post(
        url,
        headers: {
          'Authorization': userController.token.value,
          'Content-Type': 'application/json'
        },
        body: jsonEncode({"product": id})
      );
      print('Payment Intent Body: ${response.body.toString()}');
      final json = jsonDecode(response.body);
      return json;
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }

  completePayment(id) async {
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/order-complete/$id');
          print(url);
      var response = await http.post(
        url,
        headers: {
          'Authorization': userController.token.value,
          'Content-Type': 'application/json'
        },
      );
      print('Payment complete Body: ${response.body.toString()}');
      final json = jsonDecode(response.body);
      return json;
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }

  cancelPayment(id) async {
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/order-cancel/$id');
          print(url);
      var response = await http.post(
        url,
        headers: {
          'Authorization': userController.token.value,
          'Content-Type': 'application/json'
        },
      );
      print('Payment complete Body: ${response.body.toString()}');
      final json = jsonDecode(response.body);
      return json;
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }
}