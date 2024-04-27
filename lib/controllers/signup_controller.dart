import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/api_endpoints.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/signup');
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'role': 'user'
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
    print(response.statusCode);
      if (response.statusCode == 200) {
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Get.offNamed('/login');
          Get.snackbar('Success!', 'Signup success, please login!');
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error!', e.toString());
    }
  }
}