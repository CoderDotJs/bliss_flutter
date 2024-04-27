import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:get/get.dart';

class InitialPage extends StatefulWidget{
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context){
    return  const Scaffold(
      body: Center(
        child: Text('Loading...',
        style: TextStyle(color: Colors.black),
        )
      ),
    );
  }
}
