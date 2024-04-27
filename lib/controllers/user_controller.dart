import 'dart:convert';

import 'package:frontend/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController{
  final Rx<User?> _user = Rx<User?>(null);
  String token = '';

  Rx<User?> get user => _user;

    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    @override
    void onInit() {
      super.onInit();
      loadUser();
    }


    void loadUser() async {
      final SharedPreferences? prefs = await _prefs;
      String? userStr =  await prefs?.getString('user');
      String? tokenStr = await prefs?.getString('token');
      if(userStr!= null && tokenStr != null){
        User user = User.fromJson(jsonDecode(userStr) as Map<String, dynamic>);
        _user.value = user;
        token = tokenStr;
      }else{
        logout();
      }
    }


    void setUser(user)async{
      _user.value = User.fromJson(user);
      final SharedPreferences? prefs = await _prefs;
      await prefs?.setString('user',  jsonEncode(user).toString());
    }

    void logout()async{
      final SharedPreferences? prefs = await _prefs;
      await prefs?.clear();
      _user.value = User(
        id: '',
        email: '',
        name: '',
        role: '',);
        Get.offAllNamed('/login');
    }
}