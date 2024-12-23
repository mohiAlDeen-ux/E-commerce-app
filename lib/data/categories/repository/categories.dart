import 'package:flutter_application_1/data/categories/models/categories_models.dart';
import 'package:flutter_application_1/data/categories/src/categories_api_service.dart';
import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';
import 'package:flutter_application_1/domain/categories/repository/category.dart';
import "package:dartz/dartz.dart";
import 'package:flutter_application_1/servise_locator.dart';

class CategoryRepositoryImp extends CategoryRepository{
  List<CategoryEntity> cachedCategory= [
    CategoryEntity(categoryImage: "", categoryName: "All Categories", categoryId: "1"),
    CategoryEntity(categoryImage: "assets/icons/Sale.svg", categoryName: "On Sale", categoryId: "2"),
    CategoryEntity(categoryImage: "assets/icons/Man.svg", categoryName: "Man's", categoryId: "3"),
    CategoryEntity(categoryImage: "assets/icons/Woman.svg", categoryName: "Women's", categoryId: "4"),
    CategoryEntity(categoryImage: "assets/icons/Child.svg", categoryName: "Kids", categoryId: "5"),
  ];

  @override
  Future<Either<String,List<CategoryEntity>>> getCategories() async{
    //await Future.delayed(const Duration(seconds: 1));  // for test the skeleton
    if(cachedCategory.isNotEmpty) {
      return Right(cachedCategory);
    }
    return (await getIt.call<CategoriesApiService>().getCategories()).fold((error){
      return Left(error);
    }, (categoryModels){
      cachedCategory = categoryModels.map((element) => element.toEntity()).toList();
      return Right(cachedCategory);
    });
  }

  
  }