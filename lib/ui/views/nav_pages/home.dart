/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/cart_controller.dart';
import 'package:shoesphere/business_logics/controllers/favourite_controller.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/model/cart.dart';
import 'package:shoesphere/model/products.dart';
import 'package:shoesphere/model/user_favourite.dart';
import 'package:shoesphere/services/firestore_db.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/style/app_styles.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await FirestoreDB().getProducts();
          },
          child: FutureBuilder<List<Product>>(
            future: FirestoreDB().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return InkWell(
                      onTap: () => Get.to(() => DetailsScreen(data: product)),
                      child: Ink(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayColor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CachedNetworkImage(
                              imageUrl: product.thumbnail,
                              height: 100,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, progress) =>
                                  Center(child: CircularProgressIndicator(value: progress.progress)),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '\$ ${product.price.toString()}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
class DetailsScreen extends StatefulWidget {
  final Product data;
  DetailsScreen({super.key, required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mandarinColor,
        actions: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirestoreDB().checkFavourite(widget.data.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return IconButton(
                onPressed: () async {
                  final favouriteData = UserFavourite(
                    brand: widget.data.brand,
                    category: widget.data.category,
                    description: widget.data.description,
                    discountPercentage: widget.data.discountPercentage,
                    id: widget.data.id,
                    images: widget.data.images,
                    price: widget.data.price,
                    rating: widget.data.rating,
                    stock: widget.data.stock,
                    thumbnail: widget.data.thumbnail,
                    title: widget.data.title,
                  );
                  if (snapshot.data!.docs.isEmpty) {
                    await FirestoreDB().addToFavourite(favouriteData);
                    Get.find<FavoruiteController>().fetch();

                  } else {
                    Get.showSnackbar(AppStyles().failedSnacBar('Already Added'));
                  }
                },
                icon: snapshot.data!.docs.isEmpty
                    ? Icon(Icons.favorite_outline)
                    : Icon(Icons.favorite, color: Colors.red),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.data.images.map(
                      (e) => Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.mandarinColor, width: 5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: e,
                      height: 100,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(child: CircularProgressIndicator(value: progress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.data.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.grayColor,
                    ),
                  ),
                  Text(
                    widget.data.category,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Discount- ${widget.data.discountPercentage.toString()}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    'Stock- ${widget.data.stock.toString()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Rating- ${widget.data.rating.toString()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'Price- \$ ${widget.data.price.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mandarinColor,
                    ),
                  ),
                  customButton('Add to Cart', () async {
                    final cartData = UserCart(
                      brand: widget.data.brand,
                      category: widget.data.category,
                      description: widget.data.description,
                      discountPercentage: widget.data.discountPercentage,
                      id: widget.data.id,
                      images: widget.data.images,
                      price: widget.data.price,
                      rating: widget.data.rating,
                      stock: widget.data.stock,
                      thumbnail: widget.data.thumbnail,
                      title: widget.data.title,
                    );
                    await FirestoreDB().addToCart(cartData);
                    Get.find<CartController>().fetch();
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/cart_controller.dart';
import 'package:shoesphere/business_logics/controllers/favourite_controller.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/model/cart.dart';
import 'package:shoesphere/model/products.dart';
import 'package:shoesphere/model/user_favourite.dart';
import 'package:shoesphere/services/firestore_db.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/style/app_styles.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        backgroundColor: AppColors.mandarinColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await FirestoreDB().getProducts();
          },
          child: FutureBuilder<List<Product>>(
            future: FirestoreDB().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                final products = snapshot.data!.where((product) {
                  final titleLower = product.title.toLowerCase();
                  final searchLower = _searchQuery.toLowerCase();
                  return titleLower.contains(searchLower);
                }).toList();

                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return InkWell(
                      onTap: () => Get.to(() => DetailsScreen(data: product)),
                      child: Ink(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grayColor.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CachedNetworkImage(
                              imageUrl: product.thumbnail,
                              height: 100,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, progress) =>
                                  Center(child: CircularProgressIndicator(value: progress.progress)),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Text(
                              product.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '\$ ${product.price.toString()}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final Product data;
  DetailsScreen({super.key, required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mandarinColor,
        actions: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirestoreDB().checkFavourite(widget.data.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return IconButton(
                onPressed: () async {
                  final favouriteData = UserFavourite(
                    brand: widget.data.brand,
                    category: widget.data.category,
                    description: widget.data.description,
                    discountPercentage: widget.data.discountPercentage,
                    id: widget.data.id,
                    images: widget.data.images,
                    price: widget.data.price,
                    rating: widget.data.rating,
                    stock: widget.data.stock,
                    thumbnail: widget.data.thumbnail,
                    title: widget.data.title,
                  );
                  if (snapshot.data!.docs.isEmpty) {
                    await FirestoreDB().addToFavourite(favouriteData);
                    Get.find<FavoruiteController>().fetch();
                  } else {
                    Get.showSnackbar(AppStyles().failedSnacBar('Already Added'));
                  }
                },
                icon: snapshot.data!.docs.isEmpty
                    ? Icon(Icons.favorite_outline)
                    : Icon(Icons.favorite, color: Colors.red),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.data.images.map(
                      (e) => Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.mandarinColor, width: 5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: e,
                      height: 100,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(child: CircularProgressIndicator(value: progress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.data.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors.grayColor,
                    ),
                  ),
                  Text(
                    widget.data.category,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Discount- ${widget.data.discountPercentage.toString()}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    'Stock- ${widget.data.stock.toString()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'Rating- ${widget.data.rating.toString()}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    'Price- \$ ${widget.data.price.toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mandarinColor,
                    ),
                  ),
                  customButton('Add to Cart', () async {
                    final cartData = UserCart(
                      brand: widget.data.brand,
                      category: widget.data.category,
                      description: widget.data.description,
                      discountPercentage: widget.data.discountPercentage,
                      id: widget.data.id,
                      images: widget.data.images,
                      price: widget.data.price,
                      rating: widget.data.rating,
                      stock: widget.data.stock,
                      thumbnail: widget.data.thumbnail,
                      title: widget.data.title,
                    );
                    await FirestoreDB().addToCart(cartData);
                    Get.find<CartController>().fetch();
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}