import '../entity/product_entity.dart';

import '../../../core/usecase/usecase.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetCachedFlashSellProductsUsecase extends UseCase<List<ProductEntity>,dynamic>{
  @override
  Future<List<ProductEntity>> call({params}) async{
    return await getIt.call<ProductsRepository>().getCacheFlashSellProducts();
  }
}