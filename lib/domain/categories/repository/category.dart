import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';
import "package:dartz/dartz.dart";

abstract class CategoryRepository {
  Future<Either<String,List<CategoryEntity>>> getCategories();
}