import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/data/categories/src/categories_api_service.dart';
import 'package:flutter_application_1/domain/categories/repository/category.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetFullCategoriesUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await getIt.call<CategoryRepository>().getFullCategories();
  }
  
}