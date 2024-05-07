import 'dart:convert';

import 'package:frontend/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  final UserController userController = Get.put(UserController());

  Future<void> initPaymentSheet({required String productId}) async {
    try {
      // 1. create payment intent on the server
      final data = await createPaymentIntent(productId);

      // 2. initialize the payment sheet
     await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: true,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data['client_secret'],
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      Get.snackbar('Error!', e.toString());
      rethrow;
    }
  }
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Get.snackbar("Payment", "Payment successful", snackPosition: SnackPosition.BOTTOM);
      }).onError((error, stackTrace) {
        Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);
      });
    } on StripeException {
      Get.snackbar("Payment", "Payment flow has been cancelled", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  createPaymentIntent(id) async {
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/order');
      var response = await http.post(
        url,
        headers: {
          'Authorization': userController.token.value,
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: jsonEncode({"product": id})
      );
      print('Payment Intent Body: ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('Error charging user: ${err.toString()}');
    }
  }
}