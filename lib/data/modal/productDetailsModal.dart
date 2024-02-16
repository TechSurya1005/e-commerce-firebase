import 'dart:convert';
ProductDetailsModal productDetailsModalFromJson(String str) => ProductDetailsModal.fromJson(json.decode(str));
String productDetailsModalToJson(ProductDetailsModal data) => json.encode(data.toJson());
class ProductDetailsModal {
  ProductDetailsModal({
      String? description, 
      int? price, 
      String? image, 
      String? productTitle, 
      String? variety, 
      String? categoryID,}){
    _description = description;
    _price = price;
    _image = image;
    _productTitle = productTitle;
    _variety = variety;
    _categoryID = categoryID;
}

  ProductDetailsModal.fromJson(dynamic json) {
    _description = json['Description'];
    _price = json['Price'];
    _image = json['Image'];
    _productTitle = json['ProductTitle'];
    _variety = json['Variety'];
    _categoryID = json['categoryID'];
  }
  String? _description;
  dynamic? _price;
  String? _image;
  String? _productTitle;
  String? _variety;
  String? _categoryID;

  String? get description => _description;
  dynamic? get price => _price;
  String? get image => _image;
  String? get productTitle => _productTitle;
  String? get variety => _variety;
  String? get categoryID => _categoryID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Description'] = _description;
    map['Price'] = _price;
    map['Image'] = _image;
    map['ProductTitle'] = _productTitle;
    map['Variety'] = _variety;
    map['categoryID'] = _categoryID;
    return map;
  }

}