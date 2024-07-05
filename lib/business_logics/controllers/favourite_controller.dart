
import 'package:get/get.dart';
import 'package:shoesphere/model/user_favourite.dart';
import 'package:shoesphere/services/firestore_db.dart';

class FavoruiteController extends GetxController {
  RxList<UserFavourite> items = RxList<UserFavourite>([]);

  fetch() async {
    var favItems = await FirestoreDB().getFavouriteItems();
    items.value = favItems;
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}



