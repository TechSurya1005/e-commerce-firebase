import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeDetailViewModal extends ChangeNotifier {

  Map<String, dynamic> _products = {};
  Map<String, dynamic> get products => _products;

  Future<void> getProductData(String? productTitle) async {
    FirebaseFirestore.instance
        .collection('Porudcts')
        .where('ProductTitle', isEqualTo: productTitle)
        .get()
        .then((value) {
          value.docs.forEach((element) {
            _products = element.data();
          });
        });
    notifyListeners();
  }
}