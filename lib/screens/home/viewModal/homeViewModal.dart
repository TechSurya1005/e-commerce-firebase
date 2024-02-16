import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherappdynamic/data/modal/CategoryModal.dart';
import 'package:weatherappdynamic/data/modal/productModal.dart';

class HomeViewModal extends ChangeNotifier {

  CollectionReference _collectionCate =
  FirebaseFirestore.instance.collection('Category');

  List<CategoryModal> _categorieis = [];
  List<CategoryModal> get categories => _categorieis;

  Future<List<CategoryModal>> getData() async {
    QuerySnapshot querySnapshot = await _collectionCate.get();
    querySnapshot.docs.forEach((doc) {
      CategoryModal category = CategoryModal.fromDocumentSnapshot(doc);
      _categorieis.add(category);
    });
    print(_categorieis.first.categoryID);
    return categories;
  }

  List<ProductModal> _products = [];
  List<ProductModal> get products => _products;

  Future<List<ProductModal>> getProductData(String? catID) async {
    CollectionReference _collectionProduct =
    FirebaseFirestore.instance.collection('Porudcts');
    // Retrieve data from Firestore
    QuerySnapshot querySnapshot = await _collectionProduct.where("categoryID",isEqualTo: _categorieis.first.categoryID!.isEmpty ? catID.toString() : _categoryID).get();
    _products.clear();

    querySnapshot.docs.forEach((doc) {
      ProductModal productModal = ProductModal.fromJson(doc.id, doc);
      _products.add(productModal);
      print(productModal.categoryID);
      print(productModal.productTitle);
    });

    notifyListeners();
  return products;
  }

  late String? _categoryID = _categorieis.first.categoryID;

  String? get categoryID =>  _categoryID;

  void toggleCatTitle(String title) {
    _categoryID = title;
    getProductData(title);
    print(categoryID);
    notifyListeners();
  }
}