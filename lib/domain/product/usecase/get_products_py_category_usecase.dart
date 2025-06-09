import '../../../data/products/models/get_product_py_category_req.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/products.dart';
import '../../../servise_locator.dart';

class GetProductsPyCategoryUsecase extends UseCase<Either,GetProductPyCategoryReq>{
  @override
  Future<Either> call({GetProductPyCategoryReq? params}) async{
    return getIt.call<ProductsRepository>().getProductsPyCategory(params!);
  }

}