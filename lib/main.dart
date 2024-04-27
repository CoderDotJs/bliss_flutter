import 'package:flutter/material.dart';
import 'package:frontend/screens/admin_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/inital_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/product_detail_screen.dart';
import 'package:frontend/screens/product_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bliss Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomeScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/admin': (context) => const AdminScreen(),
        // '/products': (context) => ProductScreen(),
        // '/product-details': (context)=> const ProductDetailsScreen()
      },
    );
  }
}