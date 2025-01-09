import '../../../core/usecase/usecase.dart';
import '../entity/categories_entity.dart';
import 'package:dartz/dartz.dart';
import '../repository/category.dart';
import '../../../servise_locator.dart';

class GetCategoriesUsecase extends UseCase<Either<String,List<CategoryEntity>>,dynamic> {  
  @override
  Future<Either<String,List<CategoryEntity>>> call({params}) async{
    return getIt.call<CategoryRepository>().getCategories();
  }
}
