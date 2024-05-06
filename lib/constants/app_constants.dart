import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppConstants {
  static const initial = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const products = '/products';
  static const admin = '/admin';
  static const singleProduct = '/product-details';
  static const newProduct = '/new-product';
  static const updateProduct = '/updateProduct';
  static const future = '/future';
  static const listView = '/listview';
  static const gridView = '/gridView';
  static const complex = '/complex';

  List<Widget> generateListView(){
    return [
      ListTile(
        title: const Text('Home'),
        onTap: () {
          Get.offNamed(home);
        },
      ),
      ListTile(
        title: const Text('Products'),
        onTap: () {
          Get.offNamed(products);
        },
      ),
      ListTile(
        title: const Text('Future'),
        onTap: () {
          Get.offNamed(future);
        },
      ),
      ListTile(
        title: const Text('List View'),
        onTap: () {
          Get.offNamed(listView);
        },
      ),
      ListTile(
        title: const Text('Grid View'),
        onTap: () {
          Get.offNamed(gridView);
        },
      ),
      ListTile(
        title: const Text('Complex'),
        onTap: () {
          Get.offNamed(complex);
        },
      ),
    ];
  }
}