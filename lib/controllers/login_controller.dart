import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/app_constants.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final UserController userController = Get.put(UserController());

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          '${ApiEndPoints.baseUrl}/login');
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        userController.setUser(json['data']['user']);
        var token = json['data']['token'];
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        Get.offAllNamed(AppConstants.home);
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error!', e.toString(),snackPosition: SnackPosition.BOTTOM);
    }
  }
}