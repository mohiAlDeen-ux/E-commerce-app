import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetPopularProductsUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await getIt.call<ProductsRepository>().getPopularProducts();
  }

}