import 'package:flutter_application_1/data/products/models/get_familiar_product_req.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetFamiliarProductUsecase extends UseCase<Either,GetFamiliarProductReq>{
  @override
  Future<Either> call({GetFamiliarProductReq? params}) {
    return getIt.call<ProductsRepository>().getFamiliarProduct(params!);
  }
  
}