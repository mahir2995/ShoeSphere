
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/checkout_controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}
