import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/screens/product_screen.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class NewProductController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final picker = ImagePicker();
  Rx<File?> image = Rx<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final UserController userController = Get.put(UserController());


  Future<void> createProduct() async {
    print(userController.token.value);
    print(userController.user.value!.name);
    final SharedPreferences prefs = await _prefs;
      String? tokenStr = prefs.getString('token');
      print(tokenStr);
    var headers = {
    'Authorization': tokenStr.toString(),
    'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/product');
      Map body = {
        'name': nameController.text.trim(),
        'desc': descController.text.trim(),
        'price': int.parse(priceController.text),
        'stock': int.parse(stockController.text),
      };

      // var multipartReq = http.MultipartRequest('POST', url);

      // multipartReq.files.add(http.MultipartFile(
      //     'img',
      //     image.value!.readAsBytes().asStream(),
      //     image.value!.lengthSync(),
      //     filename: image.value!.path.split('/').last,
      //   ),);

      //   multipartReq.fields['data'] = jsonEncode(body);

      //   multipartReq.headers.addAll(headers);

      //   print(multipartReq.files);
      //   print(multipartReq.fields);

      // var response = await multipartReq.send();

      // print(response.statusCode);


      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
          // print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar('Success!', 'Crete Product Success!');
        nameController.clear();
        descController.clear();
        priceController.clear();
        stockController.clear();
        Get.offNamed('/products');
      } else {
        throw "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }
}