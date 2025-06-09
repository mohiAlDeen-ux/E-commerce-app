import "package:dartz/dartz.dart";

import '../../../domain/categories/entity/categories_entity.dart';
import '../../../domain/categories/entity/full_categories_entity.dart';
import '../../../domain/categories/repository/category.dart';
import '../../../servise_locator.dart';
import '../models/categories_models.dart';
import '../src/categories_api_service.dart';

class CategoryRepositoryImp extends CategoryRepository{
  List<CategoryEntity> cachedCategories= [
    CategoryEntity(categoryImage: "", categoryName: "All Categories", categoryId: "1"),
    CategoryEntity(categoryImage: "assets/icons/Sale.svg", categoryName: "On Sale", categoryId: "2"),
    CategoryEntity(categoryImage: "assets/icons/Man.svg", categoryName: "Man's", categoryId: "3"),
    CategoryEntity(categoryImage: "assets/icons/Woman.svg", categoryName: "Women's", categoryId: "4"),
    CategoryEntity(categoryImage: "assets/icons/Child.svg", categoryName: "Kids", categoryId: "5"),
  ];

  late List<FullCategoryEntity> cachedFullCategories = [
    FullCategoryEntity(
        categoryName: "On Sale", 
        categoryImage: "assets/icons/Man.svg", 
        categoryId: "1", 
        subCategories: cachedCategories
      ),
      FullCategoryEntity(
        categoryName: "On Sale", 
        categoryImage: "assets/icons/Man.svg", 
        categoryId: "1", 
        subCategories: cachedCategories
      ),
      FullCategoryEntity(
        categoryName: "On Sale", 
        categoryImage: "assets/icons/Man.svg", 
        categoryId: "1", 
        subCategories: cachedCategories
      ),
      FullCategoryEntity(
        categoryName: "On Sale", 
        categoryImage: "assets/icons/Man.svg", 
        categoryId: "1", 
        subCategories: cachedCategories
      ), 
  ];

  @override
  Future<Either<String,List<CategoryEntity>>> getCategories() async{
    //await Future.delayed(const Duration(seconds: 1));  // for test the skeleton
    if(cachedCategories.isNotEmpty) {
      return Right(cachedCategories);
    }
    return (await getIt.call<CategoriesApiService>().getCategories()).fold((error){
      return Left(error);
    }, (categoryModels){
      cachedCategories = categoryModels.map((element) => element.toEntity()).toList();
      return Right(cachedCategories);
    });
  }
  
  @override
  Future<Either<String, dynamic>> getFullCategories() async{
    await Future.delayed(const Duration(seconds: 4));
    return Right(cachedFullCategories);
    //return await getIt.call<CategoriesApiService>().getFullCategories();
  }

  
  }