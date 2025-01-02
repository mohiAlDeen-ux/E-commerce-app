// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter_application_1/domain/product/entity/product_entity.dart';



class ProductModel {
  bool bookmark;
  final String id;
  final String brandName;
  final String title;
  final List<String> images;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;


  ProductModel({
    this.bookmark = false,
    required this.id,
    required this.images,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      bookmark: map["bookmark"] as bool,
      id: map["id"] as String,
      brandName: map['brandName'] as String,
      title: map['title'] as String,
      images: map['images'] as List<String>,
      price: map['price'] as double,
      priceAfetDiscount: map['priceAfetDiscount'] != null ? map['priceAfetDiscount'] as double : null,
      dicountpercent: map['dicountPercent'] != null ? map['dicountPercent'] as int : null,
    );
  }


  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductXModel on ProductModel{
    ProductEntity toEntity(){
    return ProductEntity(
      bookmark:bookmark,
      id:id,
      brandName: brandName,
      title: title,
      images: images,
      price: price,
      priceAfetDiscount: priceAfetDiscount,
      dicountpercent: dicountpercent,
      );
  }
}
