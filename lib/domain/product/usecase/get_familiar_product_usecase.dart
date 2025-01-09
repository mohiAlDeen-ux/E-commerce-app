import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetFamiliarProductUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) {
    return getIt.call<ProductsRepository>().getFamiliarProduct(params);
  }
  
}