import 'dart:convert';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/product.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{
  var products = <Product>[].obs;
  final page = 1.obs;
  final limit = 10.obs;
  final search = ''.obs;

  final UserController  userController = Get.put(UserController());


    void loadProducts() async {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': userController.token
      };
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/products');
      http.Response response =
          await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if(json['data']['data'].length != 0){
          // List<Product> list = List.from(json['data']['data'] as List<Product>);
        products.value = RxList<Product>.from(json['data']['data'].map((x) => Product.fromJson(x)));
        // print(_products.va);
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
    }


}