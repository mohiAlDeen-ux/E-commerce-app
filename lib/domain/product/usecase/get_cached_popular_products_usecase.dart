import '../entity/product_entity.dart';

import '../../../core/usecase/usecase.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';
import 'package:dartz/dartz.dart';

class GetCachedPopularProductsUsecase extends UseCase<List<ProductEntity>,dynamic>{
  @override
  Future<List<ProductEntity>> call({params}) {
    return  getIt.call<ProductsRepository>().getCachePopularProducts();
  }
}