import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherappdynamic/data/modal/CategoryModal.dart';
import 'package:weatherappdynamic/data/modal/productModal.dart';

class HomeViewModal extends ChangeNotifier {

  CollectionReference _collectionCate =
  FirebaseFirestore.instance.collection('Category');

  List<CategoryModal> _categorieis = [];
  List<CategoryModal> get categories => _categorieis;

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionCate.get();
    querySnapshot.docs.forEach((doc) {
      CategoryModal category = CategoryModal.fromDocumentSnapshot(doc);
      _categorieis.add(category);
    });
    notifyListeners();
  }

  List<ProductModal> _products = [];
  List<ProductModal> get products => _products;

  Future<void> getProductData(String? categoryTitle) async {
    CollectionReference _collectionProduct =
    FirebaseFirestore.instance.collection('Porudcts');
    // Retrieve data from Firestore
    QuerySnapshot querySnapshot = await _collectionProduct.where("categoryTitle",isEqualTo: categoryTitle).get();
    _products.clear();
    querySnapshot.docs.forEach((doc) {
      ProductModal productModal = ProductModal.fromJson(doc);
      _products.add(productModal);
    });
  }


  String _catTitle = "Mobile";

  String get catTitle =>  _catTitle;

  void toggleCatTitle(String title) {
    _catTitle = title;
    print(catTitle);
    notifyListeners();
  }
}