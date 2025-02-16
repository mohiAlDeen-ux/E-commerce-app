import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetFlashSellProductsUsecase extends UseCase<Either,int>{
  @override
  Future<Either> call({int? params}) async{
    return await getIt.call<ProductsRepository>().getFlashSellProducts(params!);
  }

}