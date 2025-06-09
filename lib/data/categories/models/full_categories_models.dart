// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_application_1/data/categories/models/categories_models.dart';

import '../../../domain/categories/entity/full_categories_entity.dart';

class FullCategoryModels {
  String categoryName;
  String categoryImage;
  String categoryId;
  List<CategoryModels> subCategories;

  FullCategoryModels({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId,
    required this.subCategories
  });
  

  factory FullCategoryModels.fromMap(Map<String, dynamic> map) {
    return FullCategoryModels(
      subCategories: map["subCategories"],///here we need convert to list
      categoryName: map['categoryName'] as String,
      categoryImage: map['categoryImage'] as String,
      categoryId: map['categoryId'] as String,
    );
  }


  factory FullCategoryModels.fromJson(String source) => FullCategoryModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoriesXModels on FullCategoryModels{
  FullCategoryEntity toEntity(){
    return FullCategoryEntity(
      subCategories: subCategories.map((element) => element.toEntity()).toList(),
      categoryImage: categoryImage,
      categoryName: categoryName,
      categoryId: categoryId
      );
  }
}