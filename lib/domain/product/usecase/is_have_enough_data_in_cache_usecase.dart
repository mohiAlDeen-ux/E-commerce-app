import 'package:flutter_application_1/data/products/repository/products.dart';

import '../../../core/usecase/usecase.dart';
import '../../../servise_locator.dart';

class IsHaveEnoughDataInCacheUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return  getIt.call<ProductsRepositoryImp>().isHaveEnoughDataInCache();
  }

}