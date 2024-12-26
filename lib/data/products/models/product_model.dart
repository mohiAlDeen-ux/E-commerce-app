// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/domain/product/entity/product_entity.dart';



class ProductModel {

  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      brandName: map['brandName'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
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
      brandName: brandName,
      title: title,
      image: image,
      price: price,
      priceAfetDiscount: priceAfetDiscount,
      dicountpercent: dicountpercent,
      );
  }
}
