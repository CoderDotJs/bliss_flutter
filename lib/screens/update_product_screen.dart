import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductScreen extends StatefulWidget{
  const UpdateProductScreen({super.key, required this.id});
  final String id;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
   get id => widget.id;
  final product = null;
  @override
  void initState(){
   print(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        onPressed: () {
          Get.back();
        },
      icon: const Icon(Icons.arrow_back),
      ),
      title: Text(id), backgroundColor: Colors.blueAccent,foregroundColor: Colors.white,), body: const Text("Edit"), );
  }
}