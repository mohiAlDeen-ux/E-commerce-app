import '../../../core/usecase/usecase.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';
import 'package:dartz/dartz.dart';

class GetCachedPopularProductsUsecase extends UseCase<Either,int>{
  @override
  Future<Either> call({int? params}) async{
    return await getIt.call<ProductsRepository>().getCachePopularProducts(params!);
  }
}