// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../domain/categories/entity/categories_entity.dart';

class CategoryModels {
  String categoryName;
  String categoryImage;
  String categoryId;

  CategoryModels({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId
  });
  

  factory CategoryModels.fromMap(Map<String, dynamic> map) {
    return CategoryModels(
      categoryName: map['categoryName'] as String,
      categoryImage: map['categoryImage'] as String,
      categoryId: map['categoryId'] as String,
    );
  }


  factory CategoryModels.fromJson(String source) => CategoryModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoriesXModels on CategoryModels{
  CategoryEntity toEntity(){
    return CategoryEntity(
      categoryImage: categoryImage,
      categoryName: categoryName,
      categoryId: categoryId
      );
  }
}