import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget{
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context){
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text('Welcome,'),
                        Obx(() =>
                        Text(
                          userController.user.value!.name,
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 24),
                          )
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: (){
                        userController.logout();
                      },
                      icon: const Icon(Icons.logout)
                    )
                  ]
                );
  }
}