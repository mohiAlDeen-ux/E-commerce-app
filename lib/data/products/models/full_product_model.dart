// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/domain/product/entity/full_product_entity.dart';

class FullProductModel {
  final double rating;
  final int numOfReviews;
  final int numOfFiveStar;
  final int numOfFourStar;
  final int numOfThreeStar;
  final int numOfTwoStar;
  final int numOfOneStar;
  final String description;

 FullProductModel({
    required this.rating,
    required this.numOfReviews,
    required this.numOfFiveStar,
    required this.numOfFourStar,
    required this.numOfThreeStar,
    required this.numOfTwoStar,
    required this.numOfOneStar,
    required this.description,
  });



  factory FullProductModel.fromMap(Map<String, dynamic> map) {
    return FullProductModel(
      rating: map['rating'] as double,
      numOfReviews: map['numOfReviews'] as int,
      numOfFiveStar: map['numOfFiveStar'] as int,
      numOfFourStar: map['numOfFourStar'] as int,
      numOfThreeStar: map['numOfThreeStar'] as int,
      numOfTwoStar: map['numOfTwoStar'] as int,
      numOfOneStar: map['numOfOneStar'] as int,
      description: map['description'] as String,
    );
  }

  factory FullProductModel.fromJson(String source) => FullProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


extension ProductXModel on FullProductModel{
    FullProductEntity toEntity(){
    return FullProductEntity(
      numOfReviews: numOfReviews,
      numOfFiveStar: numOfFiveStar,
      numOfFourStar: numOfFourStar,
      numOfThreeStar: numOfThreeStar,
      numOfTwoStar: numOfTwoStar,
      numOfOneStar: numOfOneStar,
      description: description,
      rating: rating,
      );
  }
}
