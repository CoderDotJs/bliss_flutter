import 'package:flutter/material.dart';
import 'package:frontend/screens/new_product_screen.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget{
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(body: Column(children: [FilledButton(onPressed: (){
      Get.off(const NewProductScreen());
    }, child: const Text('Add New Product'))]),);
  }

}