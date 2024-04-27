import 'package:frontend/screens/product_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  final RxInt index = 0.obs;

  void changeIndex(i){
    index.value = i;
    switch (i) {
      case 0:
        Get.offNamed('/');
        break;
      case 1:
        Get.off(ProductScreen());
        break;
      case 2:
        Get.offNamed('/admin');
        break;
      default:
        Get.offNamed('/');
    }
  }
}