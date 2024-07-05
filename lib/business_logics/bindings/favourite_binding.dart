
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/favourite_controller.dart';

class FavouriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoruiteController());
  }
}
