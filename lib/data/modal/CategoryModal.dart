import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModal {
  String? categoryTitle;
  dynamic image;

  CategoryModal({
    this.categoryTitle,
    this.image,
  });

  // Factory constructor to create CategoryModal objects from DocumentSnapshot
  factory CategoryModal.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CategoryModal(
      categoryTitle: data['categoryTitle'],
      image: data['image'],
    );
  }
}
