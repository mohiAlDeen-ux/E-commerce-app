// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/domain/product/entity/rating_informatioin_entity.dart';

class RatingInformationModel {
  final String id;
  final double rating;
  final int numOfReviews;
  final int numOfFiveStar;
  final int numOfFourStar;
  final int numOfThreeStar;
  final int numOfTwoStar;
  final int numOfOneStar;
  final String description;


 RatingInformationModel({
    required this.id,
    required this.rating,
    required this.numOfReviews,
    required this.numOfFiveStar,
    required this.numOfFourStar,
    required this.numOfThreeStar,
    required this.numOfTwoStar,
    required this.numOfOneStar,
    required this.description
  });



  factory RatingInformationModel.fromMap(Map<String, dynamic> map) {
    return RatingInformationModel(
      id: map['id'] as String,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rating': rating,
      'numOfReviews': numOfReviews,
      'numOfFiveStar': numOfFiveStar,
      'numOfFourStar': numOfFourStar,
      'numOfThreeStar': numOfThreeStar,
      'numOfTwoStar': numOfTwoStar,
      'numOfOneStar': numOfOneStar,
      'description': description,
    };
  }

  factory RatingInformationModel.fromJson(String source) => RatingInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);


  String toJson() => json.encode(toMap());
  
}


extension RatingInformatioinXModel on RatingInformationModel{
    RatingInformatioinEntity toEntity(){
    return RatingInformatioinEntity(
      id:id,
      numOfReviews: numOfReviews,
      numOfFiveStar: numOfFiveStar,
      numOfFourStar: numOfFourStar,
      numOfThreeStar: numOfThreeStar,
      numOfTwoStar: numOfTwoStar,
      numOfOneStar: numOfOneStar,
      rating: rating, 
      description: description,
      );
  }
}
