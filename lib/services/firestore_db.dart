
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoesphere/model/cart.dart';
import 'package:shoesphere/model/products.dart';
import 'package:shoesphere/model/user_favourite.dart';
import 'package:shoesphere/model/user_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FirestoreDB {

  var box = GetStorage();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserProfile> getUserProfile() async {
    final snapshot = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    final userData =
        snapshot.docs.map((e) => UserProfile.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> userProfileUpdate(UserProfile user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.email)
        .update(user.toJson())
        .then((value) => Get.snackbar('Success', 'Updated Successfully.'));
  }
  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await _firebaseFirestore.collection('products').get();
      if (snapshot.docs.isEmpty) {
        print('No products found in Firestore');
      } else {
        print('Fetched products: ${snapshot.docs.length}');
      }

      final productData = snapshot.docs.map((doc) {
        try {
          return Product.fromSnapshot(doc);
        } catch (e) {
          print('Error parsing product from document ${doc.id}: $e');
          print('Document data: ${doc.data()}');
          return null;
        }
      }).whereType<Product>().toList();

      print('Product data length: ${productData.length}');
      return productData;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
/*
  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await _firebaseFirestore.collection('products').get();
      if (snapshot.docs.isEmpty) {
        print('No products found in Firestore');
      } else {
        print('Fetched products: ${snapshot.docs.length}');
      }
      final productData = snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
      print('Product data length: ${productData.length}');
      return productData;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

 */




  /*
  Future<List<Product>> getProducts() async {
    final snapshot = await _firebaseFirestore.collection('products').get();
    final productData =
    snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    return productData;
  }

   */

  Future<void> addToFavourite(UserFavourite favourite) async {
    await _firebaseFirestore
        .collection('favourite')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .doc()
        .set(favourite.toJson())
        .then((value) => Get.snackbar('Success', 'Added Successfully.'));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFavourite(
      int productID) async* {
    yield* _firebaseFirestore
        .collection('favourite')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .where('id', isEqualTo: productID)
        .snapshots();
  }

  Future<List<UserFavourite>> getFavouriteItems() async {
    final snapshot = await _firebaseFirestore
        .collection('favourite')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .get();
    final favouriteData =
    snapshot.docs.map((e) => UserFavourite.fromSnapshot(e)).toList();

    return favouriteData;
  }

  Future<void> deleteFromFavourite(String? documentId) async {
    await _firebaseFirestore
        .collection('favourite')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .doc(documentId)
        .delete()
        .then((value) => Get.snackbar('Success', 'Deleted Successfully.'));
  }

  Future<void> addToCart(UserCart favourite) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .doc()
        .set(favourite.toJson())
        .then((value) => Get.rawSnackbar(message: 'Added To Cart'));
  }

  Future<List<UserCart>> getCartItems() async {
    final snapshot = await _firebaseFirestore
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .get();
    final cartData =
    snapshot.docs.map((e) => UserCart.fromSnapshot(e)).toList();

    return cartData;
  }

  Future<void> deleteFromCart(String? documentId) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('items')
        .doc(documentId)
        .delete()
        .then((value) => Get.snackbar('Success', 'Deleted Successfully.'));
  }


  Future<void> order(trxid,paymentId,merchantInvoiceNumber,customerMsisdn,executeTime, items,total) async {
    final user = box.read('user');
    await _firebaseFirestore
        .collection('orders')
        .doc()
        .set({
      'user_name': user['name'],
      'user_email': user ['email'],
      'trxid': trxid,
      'paymentId': paymentId,
      'merchantInvoiceNumber': merchantInvoiceNumber,
      'customerMsisdn': customerMsisdn,
      'executeTime': executeTime,
      'items': FieldValue.arrayUnion(items),
      'total': total,


    })
        .then((value) => Get.rawSnackbar(message: 'Order placed successfully.'));
  }



}
