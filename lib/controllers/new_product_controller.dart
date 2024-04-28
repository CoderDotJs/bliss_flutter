import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
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
    var headers = {
    'Authorization': userController.token,
    'Content-Type': 'application/json',
    };
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/login');
      Map body = {
        'name': nameController.text.trim(),
        'desc': descController.text.trim(),
        'price': priceController.text,
        'stock': stockController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 201) {
        Get.snackbar('Success!', 'Crete Product Success!');
        nameController.clear();
        descController.clear();
        descController.clear();
        descController.clear();
      } else {
        throw "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }
}