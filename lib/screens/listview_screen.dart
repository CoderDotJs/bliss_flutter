import 'package:flutter/material.dart';
import 'package:frontend/components/Drawer_nav.dart';

class ListviewScreen extends StatelessWidget{
  const ListviewScreen({super.key});
   @override
  Widget build(BuildContext context){
    return const Scaffold(body: Center(child: Text("Complex api"),),drawer: DrawerNav());
  }
}