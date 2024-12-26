import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/categories/repository/category.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetCategoriesUsecase extends UseCase<Either<String,List<CategoryEntity>>,dynamic> {  
  @override
  Future<Either<String,List<CategoryEntity>>> call({params}) async{
    return getIt.call<CategoryRepository>().getCategories();
  }
}
