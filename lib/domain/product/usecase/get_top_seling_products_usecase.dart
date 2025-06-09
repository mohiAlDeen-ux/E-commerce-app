import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../servise_locator.dart';
import '../repository/products.dart';

class GetTopSelingProductsUsecase extends UseCase<Either,int>{
  @override
  Future<Either> call({int ? params}) async{
    return await getIt.call<ProductsRepository>().getTopSellingProducts(params!);
  }

}