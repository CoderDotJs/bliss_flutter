import 'package:flutter/material.dart';
import 'package:frontend/controllers/navigation_controller.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget{
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final NavigationController navigationController = Get.put(NavigationController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context){
    return Obx(() => BottomNavigationBar(
        items: _buildBottomNavBarItems(),
        currentIndex: navigationController.index.value,
        selectedItemColor: Colors.amber[800],
        onTap: navigationController.changeIndex,
      ),);
  }

    List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.red,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Products',
        backgroundColor: Colors.green,
      ),
    ];

    // Check user role to decide if the "Admin" tab should be added
    if (userController.user.value!.role == 'admin') {
      items.add(
        const BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Admin',
          backgroundColor: Colors.purple,
        ),
      );
    }

    return items;
  }
}
