import 'package:flutter/material.dart';
import 'package:frontend/screens/new_product_screen.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget{
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.blueAccent,foregroundColor: Colors.white
      ),
      body: Center(
        child: Column(
          children: [
        FilledButton(
          onPressed: (){
            Get.off(const NewProductScreen());
        },
        child: const Text('Add New Product'))]),),);
  }

}