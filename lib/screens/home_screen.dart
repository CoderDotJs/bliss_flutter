import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/components/drawer_nav.dart';
import 'package:frontend/components/bottom_nav.dart';
import 'package:frontend/components/category_tile.dart';
import 'package:frontend/components/header.dart';
import 'package:frontend/controllers/navigation_controller.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.put(UserController());
  final NavigationController navigationController = Get.put(NavigationController());

        static String manImg =
    'https://images.pexels.com/photos/874158/pexels-photo-874158.jpeg?cs=srgb&dl=pexels-olly-874158.jpg&fm=jpg';
static String otherImg =
    'https://t3.ftcdn.net/jpg/06/21/38/94/360_F_621389463_jXIw7qznHSegWOWMiwyDozSViwkhXrrC.jpg';
static String womenImg =
    'https://media.istockphoto.com/id/1307568521/photo/its-the-denim-that-does-it-for-me.jpg?s=612x612&w=0&k=20&c=0RQfpn8VJxXl6sO4aUehTsPvyYKGPwVwz1EdJRBU_Nw=';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('App'),),
      body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              children: [
                const Header(),
                const SizedBox(height: 16),
                CategoryTile(
                  title: 'Men',
                  imageUrl: manImg,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  title: 'Women',
                  imageUrl: womenImg,
                  imageAlignment: Alignment.topCenter,
                ),
                const SizedBox(height: 16),
                CategoryTile(
                  imageUrl: otherImg,
                  title: 'Others',
                ),
              ],
            ),
      // bottomNavigationBar: const BottomNav(),
      drawer: const DrawerNav()
    );
  }
}