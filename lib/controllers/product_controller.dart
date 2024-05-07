import 'dart:convert';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/product.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{
  Rx<RxList<Product>> products = RxList<Product>([]).obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxString search = ''.obs;
  RxBool isLoading = false.obs;
  RxBool hasMore = false.obs;

  final UserController  userController = Get.put(UserController());



    void loadProducts() async {
      isLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': userController.token.value
      };
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/products?page=$page&limit=$limit');
      http.Response response =
          await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if(json['data']['data'].length != 0){
          RxList<Product> list = RxList<Product>.from(json['data']['data'].map((x) => Product.fromJson(x)));
          products.value.addAll(list);
          isLoading.value = false;
        }
        if(json['data']['meta']){
          hasMore.value = json['data']['meta']['hasMore'];
        }

      } else {
        isLoading.value = false;
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.TOP);
    }
    }


}