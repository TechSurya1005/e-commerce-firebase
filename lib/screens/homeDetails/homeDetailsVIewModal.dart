import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weatherappdynamic/data/modal/productDetailsModal.dart';

class HomeDetailViewModal extends ChangeNotifier {

  ProductDetailsModal productDetailsModal = ProductDetailsModal();

  Future<void> getProductData(String? productID) async {
    CollectionReference _collectionProduct =
    FirebaseFirestore.instance.collection('Porudcts');
    DocumentSnapshot<Object?> querySnapshot = await _collectionProduct.doc(productID).get();
    productDetailsModal = ProductDetailsModal.fromJson(querySnapshot.data());
    notifyListeners();
  }
}