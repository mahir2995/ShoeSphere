/*
class Product {
  final String brand;
  final String category;
  final String description;
  final double discountPercentage;
  final int id;
  final List<dynamic> images;
  final int price;
  final double rating;
  final int stock;
  final String thumbnail;
  final String title;

  const Product({
    required this.brand,
    required this.category,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  factory Product.fromSnapshot(snapshot) {
    final data = snapshot.data()!;
    return Product(
      brand: data['brand'] ?? 'Unknown Brand',
      category: data['category'] ?? 'Unknown Category',
      description: data['description'] ?? 'No description available',
      discountPercentage: (data['discountPercentage'] ?? 0).toDouble(),
      id: data['id'] ?? 0,
      images: data['images'] ?? [],
      price: data['price'] ?? 0,
      rating: (data['rating'] ?? 0).toDouble(),
      stock: data['stock'] ?? 0,
      thumbnail: data['thumbnail'] ?? '',
      title: data['title'] ?? 'No title available',
    );
  }
}

 */
import 'package:cloud_firestore/cloud_firestore.dart';
///65
class Product {
  final String brand;
  final String category;
  final String description;
  final double discountPercentage;
  final int id;
  final List<dynamic> images;
  final int price;
  final double rating;
  final int stock;
  final String thumbnail;
  final String title;

  const Product({
    required this.brand,
    required this.category,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.images,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  factory Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Product(
      brand: data['brand'] ?? 'Unknown Brand',
      category: data['category'] ?? 'Unknown Category',
      description: data['description'] ?? 'No description available',
      discountPercentage: (data['discountPercentage'] ?? 0).toDouble(),
      id: data['id'] ?? 0,
      images: data['images'] ?? [],
      price: data['price'] ?? 0,
      rating: (data['rating'] ?? 0).toDouble(),
      stock: data['stock'] ?? 0,
      thumbnail: data['thumbnail'] ?? '', // Default image URL
      title: data['title'] ?? 'No title available',
    );
  }

}
