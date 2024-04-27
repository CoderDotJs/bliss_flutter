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
    'Content-Type': 'multipart/form-data',
    };
    try {
      // final formData = dio.FormData();
      final data = {
        'name': nameController.text.trim(),
        'desc': descController.text.trim(),
        'price': descController.text,
        'stock': descController.text,
      };


      final formData = dio.FormData.fromMap(data);

      if(image.value != null){
          formData.files.add(
            dio.MultipartFile.fromFile(
            image.value!.path,
            filename: image.value!.path.split('/').last) as MapEntry<String, dio.MultipartFile>
        );
      }

      print(formData.files);
      print(formData.fields);

      final response = await dio.Dio().post(
        // Uri.parse(
        //   '${ApiEndPoints.baseUrl}/product') as String,
        '${ApiEndPoints.baseUrl}/product',
          data: formData,
          options: dio.Options(headers: headers)
      );
      print(formData);
      print(response);



      if (response.statusCode == 201) {
        // final json = jsonDecode(response.body);
        // userController.setUser(json['data']['user']);
        // var token = json['data']['token'];
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('token', token);
        // emailController.clear();
        // passwordController.clear();
        // Get.offAllNamed('/');
        Get.snackbar('Success!', 'Crete Product Success!');
      } else {
        throw "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }
}