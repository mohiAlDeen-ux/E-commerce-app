import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';

class FullCategoryEntity {
  String categoryName;
  String categoryImage;
  String categoryId;
  List<CategoryEntity> subCategories;

  FullCategoryEntity({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId,
    required this.subCategories
  });
}