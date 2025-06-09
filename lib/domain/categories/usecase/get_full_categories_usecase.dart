import 'package:dartz/dartz.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/categories/src/categories_api_service.dart';
import '../repository/category.dart';
import '../../../servise_locator.dart';

class GetFullCategoriesUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await getIt.call<CategoryRepository>().getFullCategories();
  }
  
}