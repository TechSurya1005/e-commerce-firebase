import 'dart:convert';
ProductModal productModalFromJson(String str) => ProductModal.fromJson(json.decode(str));
String productModalToJson(ProductModal data) => json.encode(data.toJson());
class ProductModal {
  ProductModal({
      String? description, 
      String? image, 
      String? price, 
      String? productTitle, 
      String? variety, 
      String? categoryTitle,}){
    _description = description;
    _image = image;
    _price = price;
    _productTitle = productTitle;
    _variety = variety;
    _categoryTitle = categoryTitle;
}

  ProductModal.fromJson(dynamic json) {
    _description = json['Description'];
    _image = json['Image'];
    _price = json['Price'];
    _productTitle = json['ProductTitle'];
    _variety = json['Variety'];
    _categoryTitle = json['categoryTitle'];
  }
  String? _description;
  String? _image;
  String? _price;
  String? _productTitle;
  String? _variety;
  String? _categoryTitle;

  String? get description => _description;
  String? get image => _image;
  String? get price => _price;
  String? get productTitle => _productTitle;
  String? get variety => _variety;
  String? get categoryTitle => _categoryTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Description'] = _description;
    map['Image'] = _image;
    map['Price'] = _price;
    map['ProductTitle'] = _productTitle;
    map['Variety'] = _variety;
    map['categoryTitle'] = _categoryTitle;
    return map;
  }

}