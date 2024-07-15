import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String email;
  final String name;

  UserProfile({
    required this.uid,
    required this.email,
    required this.name,
  });

  // Method to convert UserProfile to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }

  // Method to create UserProfile from a map
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  // Method to create UserProfile from a DocumentSnapshot
  factory UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserProfile(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
    );
  }

  // Method to convert UserProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
