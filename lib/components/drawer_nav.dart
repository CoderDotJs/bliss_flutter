import 'package:flutter/material.dart';
import 'package:frontend/constants/app_constants.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class DrawerNav extends StatefulWidget{
  const DrawerNav({super.key});

  @override
  State<DrawerNav> createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context){
    return Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Akash'),
      ),
      ...AppConstants().generateListView()
    ],
  ),
);
  }
}