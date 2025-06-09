import 'dart:convert';
import 'package:flutter_application_1/domain/product/entity/product_entity.dart';

class ProductModel {
  bool bookmark;
  final bool isAvaliable;
  final String id;
  final String brandName;
  final String title;
  final List<String> images;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final String category;
  final String subCategory;


  ProductModel({
    this.bookmark = false,
    required this.isAvaliable,
    required this.id,
    required this.brandName,
    required this.title,
    required this.images,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
    required this.category,
    required this.subCategory,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvaliable' : isAvaliable,
      'bookmark': bookmark,
      'id': id,
      'brandName': brandName,
      'title': title,
      'images': images,
      'price': price,
      'priceAfetDiscount': priceAfetDiscount,
      'dicountpercent': dicountpercent,
      'category': category,
      'subCategory': subCategory,
    };
  }


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      isAvaliable: map["isAvaliable"] as bool,
      bookmark: map['bookmark'] as bool,
      id: map['id'] as String,
      brandName: map['brandName'] as String,
      title: map['title'] as String,
      images: List<String>.from((map['images'] as List<dynamic>)),
      price: map['price'] as double,
      priceAfetDiscount: map['priceAfetDiscount'] != null ? map['priceAfetDiscount'] as double : null,
      dicountpercent: map['dicountpercent'] != null ? map['dicountpercent'] as int : null,
      category: map['category'] as String,
      subCategory: map['subCategory'] as String,
    );
  }


  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

 
}

extension ProductXModel on ProductModel{
    ProductEntity toEntity(){
    return ProductEntity(
      isAvaliable:isAvaliable,
      bookmark:bookmark,
      id:id,
      brandName: brandName,
      title: title,
      images: images,
      price: price,
      priceAfetDiscount: priceAfetDiscount,
      dicountpercent: dicountpercent,
      category: category,
      subCategory: subCategory,
      );
  }
}
