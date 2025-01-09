import "package:dartz/dartz.dart";

import '../entity/categories_entity.dart';

abstract class CategoryRepository {
  Future<Either<String,List<CategoryEntity>>> getCategories();
}