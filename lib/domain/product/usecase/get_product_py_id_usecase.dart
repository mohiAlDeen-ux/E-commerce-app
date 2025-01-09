import '../../../core/usecase/usecase.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';
import 'package:dartz/dartz.dart';

class GetProductPyIdUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) async{
    return await getIt.call<ProductsRepository>().getProductPyId(params);
  }
}