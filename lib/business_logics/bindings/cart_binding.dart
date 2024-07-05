

import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/cart_controller.dart';

class CartBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CartController());
  }

}