import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/constants/app_constants.dart';
import 'package:frontend/screens/admin_screen.dart';
import 'package:frontend/screens/complex_screen.dart';
import 'package:frontend/screens/future_screen.dart';
import 'package:frontend/screens/gridview_screen.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/inital_screen.dart';
import 'package:frontend/screens/listview_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/product_detail_screen.dart';
import 'package:frontend/screens/product_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/screens/update_product_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  Stripe.publishableKey=dotenv.env["STRIPE_PUBLISH"]!;
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
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
      initialRoute: AppConstants.initial,
      routes: {
        AppConstants.initial:(context) => const HomeScreen(),
        AppConstants.home:(context) => const HomeScreen(),
        AppConstants.login: (context) => const LoginPage(),
        AppConstants.signup: (context) => const SignupPage(),
        AppConstants.admin: (context) => const AdminScreen(),
        AppConstants.products: (context) => ProductScreen(),
        AppConstants.future: (context) => const FutureScreen(),
        AppConstants.listView: (context) => const ListviewScreen(),
        AppConstants.gridView: (context) => const GridviewScreen(),
        AppConstants.complex: (context) => const ComplexScreen(),
        AppConstants.updateProduct: (context) => const UpdateProductScreen(id: '',),
        // '/product-details': (context)=> const ProductDetailsScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}